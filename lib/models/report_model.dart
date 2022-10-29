class ReportModel {
  factory ReportModel.fromMap(Map<String, dynamic> json) => ReportModel(
        title: json['title'] ?? '',
        totalAmount: json['amount'] ?? 0,
        categoryIcon: json['categoryIcon'] ?? '',
        categoryName: json['categoryName'] ?? '',
      );
  ReportModel({
    this.title = '',
    this.totalAmount = 0,
    this.categoryIcon = '',
    this.categoryName = '',
  });

  String title;
  int totalAmount;
  String categoryIcon;
  String categoryName;

  Map<String, dynamic> toMap() => {
        'title': title,
        'amount': totalAmount,
        'categoryIcon': categoryIcon,
        'categoryName': categoryName,
      };
}
