class ReportModel {
  factory ReportModel.fromMap(Map<String, dynamic> json) => ReportModel(
        agrs: json['agrs'] ?? 0,
        totalAmount: json['amount'] ?? 0,
        categoryIcon: json['categoryIcon'] ?? '',
        categoryName: json['categoryName'] ?? '',
        color: json['categoryColor'] ?? 0,
      );
  ReportModel({
    this.color = 0,
    this.agrs = 0,
    this.totalAmount = 0,
    this.categoryIcon = '',
    this.categoryName = '',
  });
  int color;
  int agrs;
  int totalAmount;
  String categoryIcon;
  String categoryName;

  Map<String, dynamic> toMap() => {
        // 'title': args,
        'amount': totalAmount,
        'categoryIcon': categoryIcon,
        'categoryName': categoryName,
        'categoryColor': color,
      };
}
