class PostEntity {
  final int id;
  final String title;
  final String body;
  bool isRead; // Default is false

  PostEntity({
    required this.id,
    required this.title,
    required this.body,
    this.isRead = false, // Default value
  });

  PostEntity copyWith({bool? isRead}) {
    return PostEntity(
      id: this.id,
      title: this.title,
      body: this.body,
      isRead: isRead ?? this.isRead,
    );
  }
}
