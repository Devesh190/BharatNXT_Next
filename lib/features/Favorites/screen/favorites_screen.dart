import 'package:bharatnxt_next/features/article_detail/screen/detail_screen.dart';
import 'package:bharatnxt_next/features/home/provider/article_provider.dart';
import 'package:bharatnxt_next/features/home/widget/article_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ArticleProvider>(context);
    final favorites = provider.favoriteArticles;

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: favorites.isEmpty
          ? const Center(child: Text('No favorites yet'))
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final article = favorites[index];
          return ArticleCard(
            article: article,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailScreen(article: article),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
