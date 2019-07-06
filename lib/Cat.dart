import 'dart:async';
import 'dart:convert';
import 'package:flutter_test_app/Hero.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Photo>> fetchPhotos(http.Client client) async {


  http.Response response = await http.get(
    //Uri.encodeFull removes all the dashes or extra characters present in our Uri
      Uri.encodeFull("https://api.thecatapi.com/v1/images/search?limit=5&page=10&order=Desc"),
      headers: {
        //if your api require key then pass your key here as well e.g "key": "my-long-key"
        "key": "0e3d3018-843e-4ede-b4c8-caf15bde4a33",
        'size'
            "Accept": "application/json"
      }
  );

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Photo> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final String id;
  final String url;

  Photo({this.id,  this.url,});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] as String,
      url: json['url'] as String,
    );
  }
}


class MyCat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Cat';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Photo> photos;
  String _tag='';
  String url='';

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Hero(
            tag: 'Hero$index',
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Image.network(photos[index].url)),
          ),
          onTap: () {
            _tag='Hero$index';
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return MyHero(tag:_tag,url:photos[index].url);
            }));
          },
        );
      },
    );
  }
}