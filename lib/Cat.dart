import 'package:flutter/material.dart';
import 'package:flutter_test_app/Hero.dart';

class MyCat extends StatefulWidget {
  _MyCatState createState() => new _MyCatState();
}

class _MyCatState extends State<MyCat> {
  List<String> _array = [];
  var _tag='';

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _array.length)
            _array.addAll(['$index', '${index + 1}', '${index + 2}']);
          return getRow(index);
        });
  }

  @override
  Widget getRow(int i) {
    return GestureDetector(
      child: Hero(
        tag: 'Hero$i',
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Image(
              image: AssetImage('Image/test.jpg'),
            )),
      ),
      onTap: () {
        print(i);
        _tag='Hero$i';
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return MyHero(tag:_tag);
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text("Cat"),
          ),
          body: _buildSuggestions()),
    );
  }
}
