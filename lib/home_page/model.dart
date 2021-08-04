class Article {
  String name;
  String image;

  Article({this.name, this.image});

  Article.fromJson(Map<String, dynamic> jsonData) {
    this.name = jsonData['name'];
    this.image = jsonData['img'];
  }
}
