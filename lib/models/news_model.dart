import 'package:hive/hive.dart';
import 'package:news/models/sources_model.dart';

part 'news_model.g.dart'; // For generated adapter code

@HiveType(typeId: 2)
class NewsModel extends HiveObject {
  @HiveField(0)
  String? status;

  @HiveField(1)
  int? totalResults;

  @HiveField(2)
  List<Articles>? articles;

  @HiveField(3)
  String? code;

  @HiveField(4)
  String? message;

  NewsModel({
    this.status,
    this.code,
    this.message,
    this.totalResults,
    this.articles,
  });

  factory NewsModel.fromJson(dynamic json) {
    return NewsModel(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      totalResults: json['totalResults'],
      articles: json['articles'] != null
          ? List<Articles>.from(json['articles'].map((v) => Articles.fromJson(v)))
          : null,
    );
  }
}

@HiveType(typeId: 3)
class Articles extends HiveObject {
  @HiveField(0)
  Sources? source;

  @HiveField(1)
  String? author;

  @HiveField(2)
  String? title;

  @HiveField(3)
  String? description;

  @HiveField(4)
  String? url;

  @HiveField(5)
  String? urlToImage;

  @HiveField(6)
  String? publishedAt;

  @HiveField(7)
  String? content;

  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Articles.fromJson(dynamic json) {
    return Articles(
      source: json['source'] != null ? Sources.fromJson(json['source']) : null,
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
