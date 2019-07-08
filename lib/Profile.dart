import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget{
  _MyProfileState createState() => new _MyProfileState();
}

class _MyProfileState extends State<MyProfile>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      new MaterialApp(
        debugShowCheckedModeBanner: false,
        home:new Scaffold(body:Center(child: new Text('SomeText'))));
  }
}
