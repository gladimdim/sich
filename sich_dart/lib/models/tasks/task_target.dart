class TaskTarget {
  TaskTarget({this.localizedKey, this.amount, this.type});
  final String localizedKey;
  final int amount;
  final String type;

  Map<String, dynamic> toJson() {
    return {
      'localizedKey': localizedKey,
      'amount': amount,
      'type': type,
    };
  }
}
