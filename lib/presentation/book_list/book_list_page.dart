import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coriander_app/presentation/add_book/add_book_page.dart';
import 'package:coriander_app/presentation/book_list/book_list_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchBooks(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('本一覧'),
        ),
        body: Consumer<BookListModel>(
          builder: (context, model, child) {
            final books = model.books;
            // print('-----------------------');
            // print(model.books.length);
            // print('-----------------------');
            final listTiles = books
                .map(
                  (book) => ListTile(
                    title: Text(book.title),
                  ),
                )
                .toList();
            return ListView(
              children: listTiles,
            );
          },
        ),
        floatingActionButton:
            Consumer<BookListModel>(builder: (context, model, child) {
          return FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddBookPage(),
                    fullscreenDialog: true,
                  ),
                );
                model.fetchBooks();
              });
        }),
      ),
    );
  }
}

/*
class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('本一覧'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('books').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError)
            return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: return new Text('Loading...');
            default:
              return new ListView(
                children: snapshot.data.documents.map((DocumentSnapshot document) {
                  return new ListTile(
                    title: new Text(document['title']),
                  );
                }).toList(),
              );
          }
        },
      ),
    );
  }
}
 */
