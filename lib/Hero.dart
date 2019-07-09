import 'package:flutter/material.dart';



class MyHero extends StatefulWidget {
  final String tag;
  final String url;

  MyHero({Key key, @required this.tag, @required this.url})
      : assert(tag != null),
        assert(url != null),
        super(key: key);
  @override
  _MyHeroState createState() => _MyHeroState();
}

class _MyHeroState extends State<MyHero> {


  @override
  Widget build(BuildContext context) {
    return  new MaterialApp(
        title: "Hero Cat",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: widget.tag,
            child:
                ListView(
                  children: <Widget>[
                Image.network(widget.url),
                    Center(child: new Text('Fact')),
                  ],
                )),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ));
  }
}