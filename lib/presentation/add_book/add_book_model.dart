import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coriander_app/domain/book.dart';
import 'package:flutter/material.dart';

class AddBookModel extends ChangeNotifier {
  String bookTitle = '';

  Future addBookToFirebase() async {
    if (bookTitle.isEmpty) {
      throw ('タイトルを入力してください');
    }
    Firestore.instance.collection('books').add({
      'title': bookTitle,
      'createdAt': Timestamp.now(),
    });
  }

  Future updateBook(Book book) {
    final document =
        Firestore.instance.collection('books').document(book.documentID);
    document.updateData({
      'title': bookTitle,
      'updateAt': Timestamp.now(),
    });
  }
}
