/// Une tâche liée à un cours.
class Task {
  final String id;
  final String title;
  final String courseId;
  final bool done;

  const Task({
    required this.id,
    required this.title,
    required this.courseId,
    this.done = false,
  });

  Task copyWith({
    String? id,
    String? title,
    String? courseId,
    bool? done,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      courseId: courseId ?? this.courseId,
      done: done ?? this.done,
    );
  }

  /// Lève une [FormatException] si un champ obligatoire est absent ou invalide.
  factory Task.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final title = json['title'];
    final courseId = json['courseId'];
    final done = json['done'] ?? false;
    if (id is! String ||
        title is! String ||
        courseId is! String ||
        done is! bool) {
      throw FormatException('JSON invalide pour Task', json);
    }
    return Task(id: id, title: title, courseId: courseId, done: done);
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'courseId': courseId, 'done': done};

  @override
  bool operator ==(Object other) =>
      other is Task &&
      other.id == id &&
      other.title == title &&
      other.courseId == courseId &&
      other.done == done;

  @override
  int get hashCode => Object.hash(id, title, courseId, done);

  @override
  String toString() => 'Task($id, $title, course: $courseId, done: $done)';
}
