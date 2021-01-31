import 'package:coriander_app/login/login_page.dart';
import 'package:coriander_app/presentation/book_list/book_list_page.dart';
import 'package:coriander_app/presentation/main/main_model.dart';
import 'package:coriander_app/signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  print('aaaa');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('コリアンダー'),
          ),
          body: Consumer<MainModel>(builder: (context, model, child) {
            return Center(
              child: Column(
                children: [
                  Text(
                    model.kboyText,
                    style: TextStyle(fontSize: 30),
                  ),
                  RaisedButton(
                    child: Text('新規登録'),
                    onPressed: () {
                      //model.changeKboyText();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text('ログイン'),
                    onPressed: () {
                      //model.changeKboyText();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                ],
              ),
            );
          }), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}
