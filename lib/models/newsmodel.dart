// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));


class NewsModel {
    NewsModel({
       this.status,
       this.totalResults,
       this.articles,
    });

    String? status;
    int? totalResults;
    List<Article>? articles;

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

   
}

class Article {
    Article({
      this.source,
       this.author,
       this.title,
       this.description,
        this.url,
        this.urlToImage,
     this.publishedAt,
       this.content,
    });

    Source? source;
    String? author;
    String? title;
    String? description;
    String? url;
    String? urlToImage;
    DateTime? publishedAt;
    String? content;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] == null ? null : json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"] == null ? null : json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
    );

   
}

class Source {
    Source({
      this.id,
      this.name,
    });

    String? id;
    String? name;

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
    );

   
}
