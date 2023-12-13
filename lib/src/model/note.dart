class Note {
  final String id;
  final String userId;
  final String title;
  final String content;
  final DateTime createdAt;

  Note({
    this.id = '',
    required this.userId,
    this.title = '',
    this.content = '',
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Note.fromMap(String id, Map<String, dynamic> data) {
    return Note(
      id: id,
      userId: data['userId'] ?? '',
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      createdAt: DateTime.parse(data['createdAt'] ?? ''),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'title': title,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
