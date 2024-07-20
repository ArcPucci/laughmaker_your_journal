class Recording {
  final int id;
  final int jokeId;
  final String path;
  final DateTime created;

  Recording({
    required this.id,
    required this.jokeId,
    required this.path,
    required this.created,
  });

  Recording copyWith({
    int? id,
    int? jokeId,
    String? path,
    DateTime? created,
  }) {
    return Recording(
      id: id ?? this.id,
      jokeId: jokeId ?? this.jokeId,
      path: path ?? this.path,
      created: created ?? this.created,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Recording &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          jokeId == other.jokeId &&
          path == other.path &&
          created == other.created;

  @override
  int get hashCode =>
      id.hashCode ^ jokeId.hashCode ^ path.hashCode ^ created.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'joke_id': this.jokeId,
      'path': this.path,
      'created': this.created.microsecondsSinceEpoch,
    };
  }

  factory Recording.fromMap(Map<String, dynamic> map) {
    return Recording(
      id: map['id'] as int,
      jokeId: map['joke_id'] as int,
      path: map['path'] as String,
      created: DateTime.fromMicrosecondsSinceEpoch(map['created'] as int),
    );
  }
}
