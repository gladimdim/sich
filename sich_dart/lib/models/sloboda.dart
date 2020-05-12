import 'package:sich_dart/models/tasks/tasks.dart';

class Sloboda {
  Sloboda({this.name});
  final String name;
  int money = 0;
  int cossacks = 0;
  List<ActiveTask> activeTasks = [];

  void addTask(Task task) {
    if (isActiveTask(task)) {
      return;
    }
    activeTasks.add(task.toActiveTask());
  }

  ActiveTask findActiveTaskByName(String taskName) {
    return activeTasks.firstWhere((element) => element.localizedKey == taskName,
        orElse: () => null);
  }

  bool isActiveTask(Task task) {
    return activeTasks.firstWhere(
            (element) => element.localizedKey == task.localizedKey,
            orElse: () => null) !=
        null;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'cossacks': cossacks,
      'money': money,
      'activeTasks': activeTasks,
    };
  }
}
