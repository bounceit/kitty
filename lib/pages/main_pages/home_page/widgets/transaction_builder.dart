import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/models/transaction.dart';
import 'package:kitty/repository/transaction_repository.dart';
import 'package:kitty/resources/app_colors.dart';

class TransactionBuilder extends StatefulWidget {
  const TransactionBuilder({Key? key}) : super(key: key);

  @override
  State<TransactionBuilder> createState() => _TransactionBuilderState();
}

class _TransactionBuilderState extends State<TransactionBuilder> {
  late final Future<List<TransactionModel>> _futureAllTransaction;
  @override
  void initState() {
    super.initState();
    _futureAllTransaction = KittyRepository().getAlltranzaction();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _futureAllTransaction,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final List<TransactionModel> transaction =
              snapshot.data as List<TransactionModel>;

          return ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (context, index) {
                final type = transaction[index].type;
                if (type == 'Expensive') {
                  return Card(
                    color: AppColors.appBarAddPage,
                    child: ListTile(
                      trailing: Text(
                        '-${transaction[index].amount}',
                        style: const TextStyle(color: Colors.red),
                      ),
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.green[300],
                            borderRadius: BorderRadius.circular(50)),
                        child:
                            SvgPicture.asset(transaction[index].categoryIcon),
                      ),
                      subtitle: Text(transaction[index].title.toString()),
                      title: Text(
                        transaction[index].categoryName,
                      ),
                    ),
                  );
                } else {
                  return Card(
                    color: AppColors.appBarAddPage,
                    child: ListTile(
                      trailing: Text(transaction[index].amount.toString()),
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.green[300],
                            borderRadius: BorderRadius.circular(50)),
                        child:
                            SvgPicture.asset(transaction[index].categoryIcon),
                      ),
                      subtitle: Text(transaction[index].title.toString()),
                      title: Text(transaction[index].categoryName),
                    ),
                  );
                }
              });
        });
  }
}
