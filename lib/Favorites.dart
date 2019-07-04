import 'package:flutter/material.dart';

class MyFavorites extends StatefulWidget{
  _MyFavoritesState createState() => new _MyFavoritesState();
}

class _MyFavoritesState extends State<MyFavorites>{
  int n=0;
  void increment(){
    setState(() => n++);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      new MaterialApp(
        title: "My First Try",
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text("Favorites Cats"),
          ),
          body: Center(child: new Text('SomeText'))
        ),
      );
  }
}
