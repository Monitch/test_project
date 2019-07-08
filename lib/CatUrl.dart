class Cat {
  String urlC;

  Cat(String url) {
    this.urlC = url;
  }

  Cat.fromJson(Map json)
      : urlC = json['url'];

  Map toJson() {
    return {'url': urlC};
  }
}