import 'package:flutter/material.dart';



class MyHero extends StatefulWidget {
  final String tag;

  MyHero({Key key, @required this.tag})
      : assert(tag != null);
  @override
  _MyHeroState createState() => _MyHeroState();
}

class _MyHeroState extends State<MyHero> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: widget.tag,
            child:
                ListView(
                  children: <Widget>[
                    Image(image:AssetImage('Image/test.jpg')),
                    Center(child: new Text('Test')),
                  ],
                )),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}