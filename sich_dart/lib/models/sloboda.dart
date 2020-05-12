class Sloboda {
  Sloboda({this.name});
  final String name;
  int money = 0;
  int cossacks = 0;
  List activeTasks = [];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'cossacks': cossacks,
      'money': money,
      'activeTasks': activeTasks,
    };
  }
}
