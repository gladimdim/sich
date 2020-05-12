class TaskTarget {
  final String localizedKey;
  final int amount;

  TaskTarget({this.localizedKey, this.amount});

  Map<String, dynamic> toJson() {
    return {
      'localizedKey': localizedKey,
      'amount': amount,
    };
  }
}