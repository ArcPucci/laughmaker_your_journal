import 'dart:convert';

class Joke {
  final int id;
  final String title;
  final String content;
  final List<int> tags;
  final DateTime created;

  Joke({
    required this.id,
    required this.title,
    required this.content,
    required this.tags,
    required this.created,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Joke &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          content == other.content &&
          tags == other.tags &&
          created == other.created;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      content.hashCode ^
      tags.hashCode ^
      created.hashCode;

  Joke copyWith({
    int? id,
    String? title,
    String? content,
    List<int>? tags,
    DateTime? created,
  }) {
    return Joke(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      tags: tags ?? this.tags,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'content': this.content,
      'tags': jsonEncode(this.tags),
      'created': this.created,
    };
  }

  factory Joke.fromMap(Map<String, dynamic> map) {
    final tags = jsonDecode(map['tags']);
    return Joke(
      id: map['id'] as int,
      title: map['title'] as String,
      content: map['content'] as String,
      tags: tags,
      created: DateTime.fromMicrosecondsSinceEpoch(map['created'] as int),
    );
  }
}
