// To parse this JSON data, do
//
//     final reviews = reviewsFromMap(jsonString);

import 'dart:convert';

import 'package:proyecto_app_final/models/model.dart';

class Reviews {
  Reviews({
    required this.id,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int id;
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory Reviews.fromJson(String str) => Reviews.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Reviews.fromMap(Map<String, dynamic> json) => Reviews(
        id: json["id"] == null ? null : json["id"],
        page: json["page"] == null ? null : json["page"],
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        totalResults:
            json["total_results"] == null ? null : json["total_results"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "page": page == null ? null : page,
        "results": results == null,
        "total_pages": totalPages == null ? null : totalPages,
        "total_results": totalResults == null ? null : totalResults,
      };
}

class Result {
  Result({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });

  String author;
  AuthorDetails authorDetails;
  String content;
  DateTime createdAt;
  String id;
  DateTime updatedAt;
  String url;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        author: json["author"] == null ? null : json["author"],
        authorDetails: json["author_details"] == null
            ? null
            : AuthorDetails.fromMap(json["author_details"]),
        content: json["content"] == null ? null : json["content"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"] == null ? null : json["id"],
        updatedAt: json["updated_at"] == null,
        url: json["url"] == null ? null : json["url"],
      );
}

class AuthorDetails {
  AuthorDetails({
    required this.name,
    required this.username,
    required this.avatarPath,
    required this.rating,
  });

  String name;
  String username;
  String avatarPath;
  int rating;

  factory AuthorDetails.fromJson(String str) =>
      AuthorDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthorDetails.fromMap(Map<String, dynamic> json) => AuthorDetails(
        name: json["name"] == null ? null : json["name"],
        username: json["username"] == null ? null : json["username"],
        avatarPath: json["avatar_path"] == null ? null : json["avatar_path"],
        rating: json["rating"] == null ? null : json["rating"],
      );
}
