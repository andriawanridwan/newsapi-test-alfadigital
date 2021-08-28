// To parse required this JSON data, do
//
//     final ListNewsModel = ListNewsModelFromJson(jsonString);

import 'dart:convert';

ListNewsModel listNewsModelFromJson(String str) =>
    ListNewsModel.fromJson(json.decode(str));

String listNewsModelToJson(ListNewsModel data) => json.encode(data.toJson());

class ListNewsModel {
  ListNewsModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  String? status;
  int? totalResults;
  List<NewsModel>? articles;
  String? error;
  ListNewsModel.withError(String errorMessage) {
    error = errorMessage;
  }

  factory ListNewsModel.fromJson(Map<String, dynamic> json) => ListNewsModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<NewsModel>.from(
            json["articles"].map((x) => NewsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles!.map((x) => x.toJson())),
      };
}

class NewsModel {
  NewsModel({
    required this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  Source source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String? content;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  Source({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
