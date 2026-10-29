import '../models/course.dart';
import '../models/task.dart';
import '../models/user.dart';

/// Dépôt simulé : les données JSON sont « chargées » avec un délai artificiel.
class CampusFlowRepository {
  final Duration delay;

  const CampusFlowRepository({this.delay = const Duration(milliseconds: 800)});

  Future<User> fetchUser() async {
    await Future.delayed(delay);
    return User.fromJson({
      'id': 'u1',
      'name': 'Awa Ouedraogo',
      'email': 'awa@campusflow.bf',
    });
  }

  Future<List<Course>> fetchCourses() async {
    await Future.delayed(delay);
    final data = <Map<String, dynamic>>[
      {'id': 'c1', 'name': 'Programmation mobile', 'teacher': 'M. Moctar'},
      {'id': 'c2', 'name': 'Bases de données', 'teacher': 'Mme Sawadogo'},
    ];
    return data.map(Course.fromJson).toList();
  }

  Future<List<Task>> fetchTasks() async {
    await Future.delayed(delay);
    final data = <Map<String, dynamic>>[
      {'id': 't1', 'title': 'Réviser Dart', 'courseId': 'c1', 'done': false},
      {'id': 't2', 'title': 'Rendre le TP modèles', 'courseId': 'c1', 'done': true},
      {'id': 't3', 'title': 'Schéma entité-association', 'courseId': 'c2'},
    ];
    return data.map(Task.fromJson).toList();
  }
}
