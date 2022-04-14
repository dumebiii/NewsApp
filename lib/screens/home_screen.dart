// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:news/models/article_model.dart';
import 'package:news/services/networking.dart';

class ArticlePage extends StatefulWidget {
  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late Future<List<Article>> futureNews;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureNews = ApiService().getArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Today's News"),
          centerTitle: true,
        ),
        body: Container(
          child: FutureBuilder(
              future: futureNews,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return const Text('Yes');
                } else {
                  return Center(child: const CircularProgressIndicator());
                }
              }),
        ));
  }
}
