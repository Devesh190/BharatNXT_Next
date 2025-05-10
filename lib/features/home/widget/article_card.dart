import 'package:bharatnxt_next/features/home/model/article.dart';
import 'package:bharatnxt_next/features/home/provider/article_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ArticleCard extends StatelessWidget {
  final Article article;
  final VoidCallback onTap;

  const ArticleCard({
    super.key,
    required this.article,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        title: Text(article.title),
        subtitle: Text(
          article.body,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Consumer<ArticleProvider>(
          builder: (context, provider, _) {
            final isFav = provider.isFavorite(article);
            return IconButton(
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () => provider.toggleFavorite(article),
            );
          },
        ),
        onTap: onTap,
      ),
    );
  }
}
