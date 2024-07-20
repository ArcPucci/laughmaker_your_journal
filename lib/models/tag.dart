class Tag {
  final int id;
  final String tag;

  Tag({required this.id, required this.tag});

  factory Tag.empty() => Tag(id: -1, tag: 'Empty');

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tag &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          tag == other.tag;

  @override
  int get hashCode => id.hashCode ^ tag.hashCode;

  Tag copyWith({
    int? id,
    String? tag,
  }) {
    return Tag(
      id: id ?? this.id,
      tag: tag ?? this.tag,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'tag': this.tag,
    };
  }

  factory Tag.fromMap(Map<String, dynamic> map) {
    return Tag(
      id: map['id'] as int,
      tag: map['tag'] as String,
    );
  }
}
