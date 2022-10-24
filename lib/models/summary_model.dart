class SummaryModel {
  factory SummaryModel.fromMap(Map<String, dynamic> json) => SummaryModel(
        income: json['TOTALINC'] ?? 0,
        expensive: json['TOTALEXP'] ?? 0,
        // balance: json['BALANCE'] ?? 0,
      );
  SummaryModel({
    // this.balance = 0,
    this.expensive = 0,
    this.income = 0,
  });
  // int balance;
  int expensive;
  int income;

  Map<String, dynamic> toMap() => {
        // 'BALANCE': balance,
        'TOTAL': income,
        'EXPENSIVE': expensive,
      };
}
