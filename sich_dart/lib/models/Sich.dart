import 'dart:math';

import 'package:sich_dart/models/sloboda.dart';
import 'package:sich_dart/models/tasks/tasks.dart';

class Sich {
//  Sich._internal() {
//    random = Random().nextInt(10000);
//  }

  Sich() {
    random = Random().nextInt(10000);
  }

  int random;
//  static final Sich instance = Sich._internal();

  int money = 0;
  int cossacks = 0;
  List<Sloboda> slobodas = [Sloboda(name: 'Sloboda2')];
  List<Task> tasks = [Task.sendMoney(), Task.sendCossacks()];

  Map<String, dynamic> toJson() {
    return {
      'money': money,
      'cossacks': cossacks,
      'slobodas': slobodas.map((e) => e.toJson()).toList(),
      'tasks': tasks.map((e) => e.toJson()).toList(),
    };
  }

  Sloboda findSlobodaByName(String name) {
    return slobodas.firstWhere((element) => element.name == name,
        orElse: () => null);
  }

  Task findTaskByName(String taskName) {
    return tasks.firstWhere((element) => element.localizedKey == taskName,
        orElse: () => null);
  }
}
