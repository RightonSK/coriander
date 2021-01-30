
import 'package:flutter/cupertino.dart';

class MainModel extends ChangeNotifier{
  String kboyText = 'KBOY';

  void changeKboyText(){
    kboyText = 'kboyさんかっこいい';
    notifyListeners();
  }
}