import 'package:kitty/models/category_model.dart';
import 'package:kitty/models/report_model.dart';
import 'package:kitty/models/summary_model.dart';
import 'package:kitty/models/transaction.dart';
import 'package:kitty/services.dart/database.dart';

class KittyRepository {
  Future<void> addKitty(TransactionModel kitty) async {
    await DataHelper.db.addTranscaction(
      TransactionModel(
        categoryIcon: kitty.categoryIcon,
        categoryName: kitty.categoryName,
        id: kitty.id,
        title: kitty.title,
        amount: kitty.amount,
        type: kitty.type,
      ),
    );
  }

  Future<void> addCategoryy(CategoryModel kittyCat) async {
    await DataHelper.db.addCategory(CategoryModel(
      id: kittyCat.id,
      category: kittyCat.category,
      icon: kittyCat.icon,
    ));
  }

  Future<List<SummaryModel>> totalIncome() async {
    var totalBalanses = await DataHelper.db.income();
    return totalBalanses;
  }

  Future<List<SummaryModel>> totalExpense() async {
    var totalBalanses = await DataHelper.db.expense();
    return totalBalanses;
  }

  Future<List<ReportModel>> report() async {
    final rep = await DataHelper.db.report();
    return rep
        .map((e) => ReportModel(
              totalAmount: e.totalAmount,
              title: e.title,
              categoryIcon: e.categoryIcon,
              categoryName: e.categoryName,
            ))
        .toList();
  }

  Future<List<TransactionModel>> getAlltranzaction() async {
    final gat = await DataHelper.db.getAlltrasaction();
    return gat
        .map((e) => TransactionModel(
              id: e.id,
              amount: e.amount,
              title: e.title,
              type: e.type,
              categoryIcon: e.categoryIcon,
              categoryName: e.categoryName,
            ))
        .toList();
  }

  Future<List<CategoryModel>> getAllCategory() async {
    final cat = await DataHelper.db.getAllCategory();
    return cat
        .map((e) => CategoryModel(
              category: e.category,
              icon: e.icon,
            ))
        .toList();
  }
}
