class TransactionModel {
  factory TransactionModel.fromMap(Map<String, dynamic> json) =>
      TransactionModel(
          id: json['id'] ?? 0,
          title: json['title'] ?? '',
          amount: json['amount'] ?? 0,
          type: json['type'] ?? 0,
          data: json['dateTime'] ?? 0,
          categoryIcon: json['categoryIcon'] ?? '',
          categoryName: json['categoryName'] ?? '',
          categoryColor: json['categoryColor'] ?? 0);
  TransactionModel({
    this.categoryColor = 0,
    this.id = 0,
    this.title = '',
    this.amount = 0,
    this.type = '',
    this.categoryIcon = '',
    this.categoryName = '',
    this.data = 0,
  });

  int id;
  String title;
  int amount;
  String type;
  String categoryIcon;
  String categoryName;
  int categoryColor;
  int data;

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'amount': amount,
        'type': type,
        'categoryIcon': categoryIcon,
        'categoryName': categoryName,
        'categoryColor': categoryColor,
        'dateTime': data,
      };
}
