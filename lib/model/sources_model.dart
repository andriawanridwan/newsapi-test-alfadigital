// To parse this JSON data, do
//
//     final ListsourcesModel = ListsourcesModelFromJson(jsonString);

import 'dart:convert';

ListSourcesModel listsourcesModelFromJson(String str) =>
    ListSourcesModel.fromJson(json.decode(str));

String listsourcesModelToJson(ListSourcesModel data) =>
    json.encode(data.toJson());

class ListSourcesModel {
  ListSourcesModel({
    this.status,
    this.sources,
    this.error,
  });

  String? status;
  List<SourceModel>? sources;
  String? error;
  ListSourcesModel.withError(String errorMessage) {
    error = errorMessage;
  }

  factory ListSourcesModel.fromJson(Map<String, dynamic> json) =>
      ListSourcesModel(
        status: json["status"],
        sources: List<SourceModel>.from(
            json["sources"].map((x) => SourceModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "sources": List<dynamic>.from(sources!.map((x) => x.toJson())),
      };
}

class SourceModel {
  SourceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });

  String id;
  String name;
  String description;
  String url;
  String category;
  String language;
  String country;

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        url: json["url"],
        category: json["category"],
        language: json["language"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "url": url,
        "category": category,
        "language": language,
        "country": country,
      };
}
