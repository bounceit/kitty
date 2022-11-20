import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/models/transaction.dart';
import 'package:kitty/repository/transaction_repository.dart';

class SearchTransactionList extends StatefulWidget {
  const SearchTransactionList({Key? key}) : super(key: key);

  @override
  State<SearchTransactionList> createState() => _SearchTransactionListState();
}

class _SearchTransactionListState extends State<SearchTransactionList> {
  late final Future<List<TransactionModel>> _futureAllTransaction;
  @override
  void initState() {
    super.initState();
    // _futureAllTransaction =
    //     KittyRepository().search();
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
                final data = transaction[index].data;
                final currentData = DateTime.now().day;
                final transactionData =
                    DateTime.fromMillisecondsSinceEpoch(data).day;
                if (type == 'Expensive' && transactionData == currentData) {
                  return Card(
                    elevation: 0.0,
                    color: Colors.transparent,
                    child: ListTile(
                      trailing: Text(
                        '-${transaction[index].amount}',
                        style: const TextStyle(color: Colors.red),
                      ),
                      leading: Container(
                        decoration: BoxDecoration(
                            color: Color(transaction[index].categoryColor),
                            borderRadius: BorderRadius.circular(50)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              SvgPicture.asset(transaction[index].categoryIcon),
                        ),
                      ),
                      subtitle: Text(transaction[index].title.toString()),
                      title: Text(
                        transaction[index].categoryName,
                      ),
                    ),
                  );
                } else if (type == 'Income') {
                  return Card(
                    color: Colors.transparent,
                    elevation: 0.0,
                    child: ListTile(
                      trailing: Text(transaction[index].amount.toString()),
                      leading: Container(
                        decoration: BoxDecoration(
                            color: Color(transaction[index].categoryColor),
                            borderRadius: BorderRadius.circular(50)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              SvgPicture.asset(transaction[index].categoryIcon),
                        ),
                      ),
                      subtitle: Text(transaction[index].title.toString()),
                      title: Text(transaction[index].categoryName),
                    ),
                  );
                }
                return Container();
              });
        });
  }
}
