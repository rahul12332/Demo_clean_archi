import '../../domain/entities/post_entities.dart';

class PostModel {
  final int id;
  final String title;
  final String body;

  PostModel({required this.id, required this.title, required this.body});

  // Factory constructor to parse JSON into a PostModel
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  // Method to convert PostModel to PostEntity
  PostEntity toEntity() {
    return PostEntity(
      id: id,
      title: title,
      body: body,
    );
  }
}
