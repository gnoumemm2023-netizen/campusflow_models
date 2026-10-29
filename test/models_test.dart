import 'package:campusflow_models/campusflow_models.dart';
import 'package:test/test.dart';

void main() {
  test('copyWith ne modifie que le champ demandé', () {
    const task = Task(id: 't1', title: 'Réviser Dart', courseId: 'c1');
    final updated = task.copyWith(done: true);

    expect(updated.done, isTrue);
    expect(updated.title, 'Réviser Dart');
    expect(updated.id, 't1');
    expect(task.done, isFalse); // l'original reste inchangé
  });

  test('fromJson construit correctement un Course', () {
    final course = Course.fromJson({
      'id': 'c1',
      'name': 'Programmation mobile',
      'teacher': 'M. Moctar',
    });

    expect(course.id, 'c1');
    expect(course.name, 'Programmation mobile');
    expect(course.teacher, 'M. Moctar');
  });

  test('fromJson lève une FormatException si un champ manque', () {
    expect(
      () => User.fromJson({'id': 'u1', 'name': 'Awa'}), // email absent
      throwsA(isA<FormatException>()),
    );
  });
}
