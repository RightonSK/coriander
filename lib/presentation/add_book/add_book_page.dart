import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coriander_app/presentation/add_book/add_book_model.dart';
import 'package:coriander_app/presentation/book_list/book_list_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddBookModel>(
      create: (_) => AddBookModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('本追加'),
        ),
        body: Consumer<AddBookModel>(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    onChanged: (text) {
                      model.bookTitle = text;
                    },
                  ),
                  RaisedButton(
                    child: Text('追加する'),
                    onPressed: () async {
                      //todo: firestoreに本を追加
                      try {
                        await model.addBookToFirebase();

                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('保存しました!'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        Navigator.of(context).pop();
                      } catch (e) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(e.toString()),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
