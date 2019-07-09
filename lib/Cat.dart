import 'dart:convert';
import 'package:flutter_test_app/Hero.dart';
import 'package:flutter_test_app/FactUrl.dart';
import 'package:flutter_test_app/CatUrl.dart';
import 'package:flutter_test_app/API.dart';
import 'package:flutter/material.dart';

class MyCat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Startup Name Generator',
      home: Cats(),
    );
  }
}
// #enddocregion MyApp

// #docregion RWS-var
class MyCatState extends State<Cats> {
  var _cat = new List<Cat>();
  final Set<String> _favorited = Set<String>();
  var _fact = new List<Fact>();
  var urlc = "https://api.thecatapi.com/v1/images/search?limit=5&page=10&order=Desc";
  var urlf = "https://catfact.ninja/facts?limit=5";
  String _tag='';

  _GetCat() {
    API.getUsers(urlc).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        _cat = list.map((model) => Cat.fromJson(model)).toList();
      });
    });
  }
  Widget _buildSuggestions() {
    return ListView.builder(
        itemCount:_cat.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          return _buildRow(_cat[index].urlC,index);
        });
  }
  initState() {
    super.initState();
    _GetCat();
    //    _GetFact();
  }

  dispose() {
    super.dispose();
  }
  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final  tiles = _favorited.map(
                (String url) {
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(url,width: 300,height: 250, alignment: Alignment.center,),
                    new Divider()
                  ],
                ),
              );
            },

          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Favorited Cat'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget _buildRow(String url, int index) {
    final bool alreadySaved = _favorited.contains(url.toString());
    return Row(
      children: <Widget>[
        GestureDetector(
            child: Hero(
              tag: 'Hero$index',
                  child: Image.network(url,width: 200,height: 200,)),
            onTap: () {
              _tag='Hero$index';
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return MyHero(tag:_tag,url:url);
              }
              )
              );
            }
            ),
        GestureDetector(
             child: Padding(
               padding: const EdgeInsets.only(left: 75),
               child: Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                 color: alreadySaved ? Colors.red : null,),),
                 onTap: () {
                    setState(() {
                     if (alreadySaved) {
                      _favorited.remove(url.toString());
                     } else {
                       _favorited.add(url);
                     }
                   });
                 },
                )],);}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat List'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}


class Cats extends StatefulWidget {
  @override
  MyCatState createState() => MyCatState();
}