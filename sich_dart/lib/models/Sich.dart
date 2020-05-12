import 'package:sich_dart/models/sloboda.dart';
import 'package:sich_dart/models/tasks/tasks.dart';

class Sich {
  Sich._constructor();

  static final Sich instance = Sich._constructor();

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
}
