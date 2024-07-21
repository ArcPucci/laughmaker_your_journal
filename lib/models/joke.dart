import 'dart:convert';

import 'package:laughmaker_your_journal/utils/utils.dart';

class Joke {
  final int id;
  final String title;
  final String content;
  final List<int> tags;
  final DateTime created;

  factory Joke.empty() => Joke(
        id: -1,
        title: '',
        content: '',
        tags: [],
        created: DateTime(2024, 07, 13),
      );

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
      'created': this.created.withZeroTime.microsecondsSinceEpoch,
    };
  }

  factory Joke.fromMap(Map<String, dynamic> map) {
    final list = jsonDecode(map['tags'] as String) as List<dynamic>;
    final list2 = list.map((e) => e as int).toList();
    return Joke(
      id: map['id'] as int,
      title: map['title'] as String,
      content: map['content'] as String,
      tags: list2,
      created: DateTime.fromMicrosecondsSinceEpoch(map['created'] as int),
    );
  }
}
