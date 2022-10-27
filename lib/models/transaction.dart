class TransactionModel {
  factory TransactionModel.fromMap(Map<String, dynamic> json) =>
      TransactionModel(
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        amount: json['amount'] ?? 0,
        type: json['type'] ?? 0,
        categoryIcon: json['ICON'] ?? '',
        categoryName: json['CATEGORY'] ?? '',
      );
  TransactionModel({
    this.id = 0,
    this.title = '',
    this.amount = 0,
    this.type = '',
    this.categoryIcon = '',
    this.categoryName = '',
  });

  int id;
  String title;
  int amount;
  String type;
  String categoryIcon;
  String categoryName;

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'amount': amount,
        'type': type,
        'ICON': categoryIcon,
        'CATEGORY': categoryName,
      };
}