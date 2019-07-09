class Fact {
  String factF;

  Fact(String fact) {
    this.factF = fact;
  }

  Fact.fromJson(Map json)
      : factF = json['data'];

  Map toJson() {
    return {'data': factF};
  }
}