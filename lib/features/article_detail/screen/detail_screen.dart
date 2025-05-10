import 'package:bharatnxt_next/features/home/model/article.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Article article;

  const DetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Article")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Title: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                    child: Text(article.title,style: TextStyle(fontSize: 20))),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Body: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Text(article.body,style: TextStyle(fontSize: 20))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
