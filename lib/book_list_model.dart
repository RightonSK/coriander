import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coriander_app/book.dart';
import 'package:flutter/cupertino.dart';

class BookListModel extends ChangeNotifier {
  List<Book> books = [];

  Future fetchBooks() async {
    final docs = await Firestore.instance.collection('books').getDocuments();
    final books = docs.documents.map((doc) => Book(doc['title'])).toList();
    this.books = books;
    print('-------');
    print(books.length);
    notifyListeners();
  }
}
