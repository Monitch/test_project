import 'package:flutter/material.dart';
import 'package:flutter_test_app/Cat.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => MainScreen(),
        '/second': (BuildContext context) => SecondScreen(),
        '/catlist': (BuildContext context) => MyCat(),
      }));
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            child: Text('Sign up'),
            textColor: Colors.white,
            color: Colors.green,
          ),
        ));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/catlist');
                  },
                  child: Text('Cat')),
            ]
          ),
        ));
  }
}