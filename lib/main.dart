import 'package:coriander_app/main_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  print('aaa');
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
          body: Consumer<MainModel>(
            builder: (context, model, child) {
              return Center(
                child: Column(
                  children: [
                    Text(model.kboyText,
                    style: TextStyle(fontSize: 30),
                    ),
                    RaisedButton(
                        child: Text('ボタン'),
                        onPressed: (){
                          model.changeKboyText();
                        },
                    ),
                  ],
                ),
              );
            }
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}
