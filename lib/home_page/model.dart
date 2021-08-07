class Article {
  String name;
  String image;
  String birthDAy;
  String nickname;
  String portrayed;
  String status;
  Article(
      {this.name,
      this.image,
      this.birthDAy,
      this.nickname,
      this.portrayed,
      this.status});

  Article.fromJson(Map<String, dynamic> jsonData) {
    this.name = jsonData['name'];
    this.image = jsonData['img'];
    this.birthDAy = jsonData['birthday'];
    this.nickname = jsonData['nickname'];
    this.nickname = jsonData['portrayed'];
    this.nickname = jsonData['status'];
  }
}
