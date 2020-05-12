import 'package:sich_dart/models/tasks/task_target.dart';

class Task {
  Task({this.target, this.localizedKey, this.localizedDescriptionKey});
  final TaskTarget target;

  final String localizedKey;
  final String localizedDescriptionKey;

  Map<String, dynamic> toJson() {
    return {
      'target': target.toJson(),
      'localizedKey': localizedKey,
      'localizedKeyDescription': localizedDescriptionKey
    };
  }

  ActiveTask toActiveTask() {
    return ActiveTask(localizedKey, localizedDescriptionKey, target, 0);
  }

  static Task sendMoney() {
    return Task(
      localizedKey: 'sichTasks.sendMoney',
      localizedDescriptionKey: 'sichTasks.sendMoneyDescription',
      target: TaskTarget(
        amount: 100,
        localizedKey: 'resources.money',
      ),
    );
  }

  static Task sendCossacks() {
    return Task(
      localizedKey: 'sichTasks.sendCossacks',
      localizedDescriptionKey: 'sichTasks.sendCossacksDescription',
      target: TaskTarget(
        amount: 100,
        localizedKey: 'cityProps.cossacks',
      ),
    );
  }
}

class ActiveTask extends Task {
  ActiveTask(String localizedKey, String localizedDescriptionKey,
      TaskTarget target, this.progress)
      : super(
            localizedKey: localizedKey,
            localizedDescriptionKey: localizedDescriptionKey,
            target: target);
  int progress = 0;

  Map<String, dynamic> toJson() {
    var json = super.toJson();

    json['progress'] = progress;

    return json;
  }
}
