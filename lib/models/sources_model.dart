import 'package:hive/hive.dart';

part 'sources_model.g.dart'; // Needed for generated adapter code

@HiveType(typeId: 0)
class SourcesModel extends HiveObject {
  @HiveField(0)
  String? status;

  @HiveField(1)
  List<Sources>? sources;

  @HiveField(2)
  String? code;

  @HiveField(3)
  String? message;

  SourcesModel({this.status, this.sources, this.code, this.message});

  factory SourcesModel.fromJson(Map<String, dynamic> json) {
    return SourcesModel(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      sources: json['sources'] != null
          ? List<Sources>.from(json['sources'].map((v) => Sources.fromJson(v)))
          : null,
    );
  }
}

@HiveType(typeId: 1)
class Sources extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? description;

  @HiveField(3)
  String? url;

  @HiveField(4)
  String? category;

  @HiveField(5)
  String? language;

  @HiveField(6)
  String? country;

  Sources({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  factory Sources.fromJson(Map<String, dynamic> json) {
    return Sources(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      url: json['url'],
      category: json['category'],
      language: json['language'],
      country: json['country'],
    );
  }
}
