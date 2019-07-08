class Fact {
  String factF;

  Fact(String fact) {
    this.factF = fact;
  }

  Map toJson() {
    return {'data': factF};
  }

  Fact.fromJson(Map json)
      : factF = json['data'];
}