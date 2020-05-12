class TaskTarget {
  TaskTarget({this.localizedKey, this.amount});
  final String localizedKey;
  final int amount;

  Map<String, dynamic> toJson() {
    return {
      'localizedKey': localizedKey,
      'amount': amount,
    };
  }
}
