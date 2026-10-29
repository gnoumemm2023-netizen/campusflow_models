/// Un cours enseigné sur le campus.
class Course {
  final String id;
  final String name;
  final String teacher;

  const Course({
    required this.id,
    required this.name,
    required this.teacher,
  });

  Course copyWith({String? id, String? name, String? teacher}) {
    return Course(
      id: id ?? this.id,
      name: name ?? this.name,
      teacher: teacher ?? this.teacher,
    );
  }

  /// Lève une [FormatException] si un champ obligatoire est absent ou invalide.
  factory Course.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final name = json['name'];
    final teacher = json['teacher'];
    if (id is! String || name is! String || teacher is! String) {
      throw FormatException('JSON invalide pour Course', json);
    }
    return Course(id: id, name: name, teacher: teacher);
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'teacher': teacher};

  @override
  bool operator ==(Object other) =>
      other is Course &&
      other.id == id &&
      other.name == name &&
      other.teacher == teacher;

  @override
  int get hashCode => Object.hash(id, name, teacher);

  @override
  String toString() => 'Course($id, $name, $teacher)';
}
