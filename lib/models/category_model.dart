class CategoryModel {
  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        category: json['categoryName'] ?? 0,
        icon: json['categoryIcon'] ?? 0,
      );
  CategoryModel({
    this.category = '',
    this.icon = '',
    this.id = 0,
  });
  int id;
  String category;
  String icon;

  Map<String, dynamic> toMap() => {
        'categoryName': category,
        'categoryIcon': icon,
      };
}
