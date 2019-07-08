import 'dart:convert';
import 'package:flutter_test_app/Hero.dart';
import 'package:flutter_test_app/FactUrl.dart';
import 'package:flutter_test_app/CatUrl.dart';
import 'package:flutter_test_app/API.dart';
import 'package:flutter/material.dart';

class MyCat extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Http App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyListScreen(),
    );
  }
}
class MyListScreen extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  var _cat = new List<Cat>();
  var _fact = new List<Fact>();
  var urlc = "https://api.thecatapi.com/v1/images/search?limit=5&page=10&order=Desc";
  var urlf = "https://catfact.ninja/facts?limit=5";

  _GetCat() {
    API.getUsers(urlc).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        _cat = list.map((model) => Cat.fromJson(model)).toList();
      });
    });
  }
//  _GetFact() {
//    API.getUsers(urlf).then((response) {
//      setState(() {
//        Iterable list = json.decode(response.body);
//        _fact = list.map((model) => Fact.fromJson(model)).toList();
//      });
//    });
//  }

  initState() {
    super.initState();
    _GetCat();
 //   _GetFact();
  }

  dispose() {
    super.dispose();
  }

  String _tag='';
  String url='';

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User List"),
        ),
        body: ListView.builder(
          itemCount: _cat.length,
          itemBuilder: (context, index) {
            return  GestureDetector(
              child: Hero(
                tag: 'Hero$index',
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Image.network(_cat[index].urlC)),
              ),
              onTap: () {
                _tag='Hero$index';
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return MyHero(tag:_tag,url:_cat[index].urlC);
                }));
              },
            );
          },
        ));
  }
}