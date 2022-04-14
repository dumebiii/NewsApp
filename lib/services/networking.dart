import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/models/article_model.dart';

//Now let's make the HTTP request services
// this class will alows us to make a simple get http request
// from the API and get the Articles and then return a list of Articles

class ApiService {
  //let's add an Endpoint URL, you can check the website documentation
  // and learn about the different Endpoint
  //for this example I'm going to use a single endpoint

  //NOTE: make sure to use your OWN apikey, you can make a free acount and
  // choose a developer option it's FREE
  final endPointUrl =
      "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e30a4cf890864a45925374cb913ad777";

  //Now let's create the http request function
  // but first let's import the http package

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];
      print(body);

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}

// class Apimanager {
//   static dynamic apikey = 'e30a4cf890864a45925374cb913ad777';
//   String newsurl =
//       'https://newsapi.org/v2/top-headlines?country=ng&apiKey=$apikey';

//   Future<List<Article>> fetchData() async {
//     Response response = await get(Uri.parse(newsurl));
//     if (response.statusCode == 200) {
//       Map<String, dynamic> dat = jsonDecode(response.body);
//       print(dat);
//       List<dynamic> body = dat['articles'];
//       List<Article> articles =
//           body.map((dynamic item) => Article.fromJson(item)).toList();

//       return articles;
//     } else {
//       throw ('Something went wrong');
//     }
//   }
// }



//   Future<List<Newsmodel>?> fetchData() async {
//     var client = http.Client();

//     var response = await client.get(Uri.parse(newsurl));
//     if (response.statusCode == 200) {
//       print(response.body);
//       var datt = response.body;
//       // var dattt = json.decode(datt);

//       return newsmodelFromJson(datt);

//       // ignore: avoid_print, dead_code

//     }
//   }
// }

