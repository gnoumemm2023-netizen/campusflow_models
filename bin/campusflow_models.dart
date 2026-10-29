import 'package:campusflow_models/campusflow_models.dart';

Future<void> main() async {
  const repo = CampusFlowRepository();
  print('Chargement...');
  final user = await repo.fetchUser();
  final courses = await repo.fetchCourses();
  final tasks = await repo.fetchTasks();

  print('Utilisateur : $user');
  for (final c in courses) {
    print('Cours : $c');
  }
  for (final t in tasks) {
    print('Tâche : $t');
  }

  final terminee = tasks.first.copyWith(done: true);
  print('copyWith : $terminee');
}
