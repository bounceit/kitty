import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/pages/main_pages/search_page/widgets/bloc/transaction_bloc.dart';

class TransactionBuilder extends StatefulWidget {
  const TransactionBuilder({Key? key}) : super(key: key);

  @override
  State<TransactionBuilder> createState() => _TransactionBuilderState();
}

class _TransactionBuilderState extends State<TransactionBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionBloc()..add(InitTransaction()),
      child: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: state.transactions.length,
              itemBuilder: (context, index) {
                final type = state.transactions[index].type;
                final data = state.transactions[index].data;
                final currentData = DateTime.now().day;
                final transactionData =
                    DateTime.fromMillisecondsSinceEpoch(data).day;
                if (type == 'Expensive' && transactionData == currentData) {
                  return Card(
                    elevation: 0.0,
                    color: Colors.transparent,
                    child: ListTile(
                      trailing: Text(
                        '-${state.transactions[index].amount}',
                        style: const TextStyle(color: Colors.red),
                      ),
                      leading: Container(
                        decoration: BoxDecoration(
                            color:
                                Color(state.transactions[index].categoryColor),
                            borderRadius: BorderRadius.circular(50)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                              state.transactions[index].categoryIcon),
                        ),
                      ),
                      subtitle:
                          Text(state.transactions[index].title.toString()),
                      title: Text(
                        state.transactions[index].categoryName,
                      ),
                    ),
                  );
                } else if (type == 'Income') {
                  return Card(
                    color: Colors.transparent,
                    elevation: 0.0,
                    child: ListTile(
                      trailing:
                          Text(state.transactions[index].amount.toString()),
                      leading: Container(
                        decoration: BoxDecoration(
                            color:
                                Color(state.transactions[index].categoryColor),
                            borderRadius: BorderRadius.circular(50)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                              state.transactions[index].categoryIcon),
                        ),
                      ),
                      subtitle:
                          Text(state.transactions[index].title.toString()),
                      title: Text(state.transactions[index].categoryName),
                    ),
                  );
                }
                return Container();
              });
        },
      ),
    );
  }
}
