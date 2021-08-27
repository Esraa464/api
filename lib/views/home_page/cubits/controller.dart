import 'package:dio/dio.dart';
import 'package:untitled/views/home_page/models/model.dart';

class Controller {
  Dio dio = Dio();


  Future<List<Article>> fetchData() async {
    final response =
    await dio.get('https://www.breakingbadapi.com/api/characters');
    final resp = response.data as List;
    List<Article> article = [];
    resp.forEach((element) {
      Article art = Article.fromJson(element);
      article.add(art);
    });
    return article;
  }

}