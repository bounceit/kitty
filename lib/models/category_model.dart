class CategoryModel {
  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        category: json['Category'] ?? 0,
        icon: json['Icon'] ?? 0,
      );
  CategoryModel({
    this.category = '',
    this.icon = '',
  });
  // int balance;
  String category;
  String icon;

  Map<String, dynamic> toMap() => {
        // 'BALANCE': balance,
        'Category': category,
        'Icon': icon,
      };
}
