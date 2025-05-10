import 'package:bharatnxt_next/features/home/model/article.dart';
import 'package:bharatnxt_next/features/home/provider/article_provider.dart';
import 'package:bharatnxt_next/features/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Register your adapter
  Hive.registerAdapter(ArticleAdapter());

  // Open box for favorites
  await Hive.openBox<Article>('favorites');
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ArticleProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
