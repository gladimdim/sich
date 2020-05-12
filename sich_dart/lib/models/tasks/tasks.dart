import 'package:sich_dart/models/tasks/task_target.dart';

class Task {
  final TaskTarget target;

  final String localizedKey;
  final String localizedDescriptionKey;

  Task({this.target, this.localizedKey, this.localizedDescriptionKey});

  Map<String, dynamic> toJson() {
    return {
      'target': target.toJson(),
      'localizedKey': localizedKey,
      'localizedKeyDescription': localizedDescriptionKey
    };
  }

  static Task sendMoney() {
    return Task(
      localizedKey: 'sichTasks.sendMoney',
      localizedDescriptionKey: 'sichTasks.sendMoneyDescriptoin',
      target: TaskTarget(
        amount: 100,
        localizedKey: 'resources.money',
      ),
    );
  }

  static Task sendCossacks() {
    return Task(
      localizedKey: 'sichTasks.sendCossacks',
      localizedDescriptionKey: 'sichTasks.sendCossacksDescriptoin',
      target: TaskTarget(
        amount: 100,
        localizedKey: 'cityProps.cossacks',
      ),
    );
  }
}

class ActiveTask extends Task {
  int progress = 0;
}
