import 'package:laughmaker_your_journal/utils/utils.dart';

class Recording {
  final int id;
  final int jokeId;
  final int duration;
  final String path;
  final DateTime created;

  Recording({
    required this.id,
    required this.jokeId,
    required this.duration,
    required this.path,
    required this.created,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Recording &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          jokeId == other.jokeId &&
          duration == other.duration &&
          path == other.path &&
          created == other.created;

  @override
  int get hashCode =>
      id.hashCode ^
      jokeId.hashCode ^
      duration.hashCode ^
      path.hashCode ^
      created.hashCode;

  Recording copyWith({
    int? id,
    int? jokeId,
    int? duration,
    String? path,
    DateTime? created,
  }) {
    return Recording(
      id: id ?? this.id,
      jokeId: jokeId ?? this.jokeId,
      duration: duration ?? this.duration,
      path: path ?? this.path,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'joke_id': this.jokeId,
      'duration': this.duration,
      'path': this.path,
      'created': this.created.withZeroTime.microsecondsSinceEpoch,
    };
  }

  factory Recording.fromMap(Map<String, dynamic> map) {
    return Recording(
      id: map['id'] as int,
      jokeId: map['joke_id'] as int,
      duration: map['duration'] as int,
      path: map['path'] as String,
      created: DateTime.fromMicrosecondsSinceEpoch(map['created'] as int),
    );
  }
}
