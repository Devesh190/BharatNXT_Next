import 'package:bharatnxt_next/features/home/model/article.dart';
import 'package:bharatnxt_next/features/home/service/article_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';


class ArticleProvider with ChangeNotifier {
  final ArticleService _service = ArticleService();
  List<Article> _articles = [];
  List<Article> _filteredArticles = [];

  bool isLoading = false;
  String errorMessage = '';

  List<Article> get articles => _filteredArticles;

  final _favBox = Hive.box<Article>('favorites');

  List<Article> get favoriteArticles => _favBox.values.toList();

  Future<void> loadArticles() async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    try {
      _articles = await _service.fetchArticles();
      _filteredArticles = _articles;
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  void search(String query) {
    _filteredArticles = _articles.where((article) =>
    article.title.toLowerCase().contains(query.toLowerCase()) ||
        article.body.toLowerCase().contains(query.toLowerCase())
    ).toList();
    notifyListeners();
  }

  bool isFavorite(Article article) {
    return _favBox.containsKey(article.id);
  }

  void toggleFavorite(Article article) {
    if (isFavorite(article)) {
      _favBox.delete(article.id);
    } else {
      _favBox.put(article.id, article);
    }
    notifyListeners();
  }
}
