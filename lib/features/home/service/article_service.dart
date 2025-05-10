import 'dart:convert';
import 'package:bharatnxt_next/features/home/model/article.dart';
import 'package:http/http.dart' as http;

class ArticleService {
  Future<List<Article>> fetchArticles() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
