class CategoryModel {
  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
      category: json['categoryName'] ?? 0,
      icon: json['categoryIcon'] ?? 0,
      id: json['id'] ?? 0,
      color: json['colorIcon']);
  CategoryModel({
    this.color = 0,
    this.category = '',
    this.icon = '',
    this.id = 0,
  });
  int color;
  int id;
  String category;
  String icon;

  Map<String, dynamic> toMap() => {
        'id': id,
        'categoryName': category,
        'categoryIcon': icon,
        'colorIcon': color,
      };
}
