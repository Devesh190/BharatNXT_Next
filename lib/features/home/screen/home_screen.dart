import 'package:bharatnxt_next/features/Favorites/screen/favorites_screen.dart';
import 'package:bharatnxt_next/features/article_detail/screen/detail_screen.dart';
import 'package:bharatnxt_next/features/home/provider/article_provider.dart';
import 'package:bharatnxt_next/features/home/widget/article_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ArticleProvider>(context, listen: false).loadArticles());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FavoritesScreen()),
              );
            },
          ),
        ],
      ),
      body: Consumer<ArticleProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => provider.search(value),
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: provider.loadArticles,
                  child: provider.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : provider.errorMessage.isNotEmpty
                      ? Center(child: Text(provider.errorMessage))
                      : ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: provider.articles.length,
                    itemBuilder: (context, index) {
                      final article = provider.articles[index];
                      return ArticleCard(
                        article: article,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  DetailScreen(article: article),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),

    );
  }
}
