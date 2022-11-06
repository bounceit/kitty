import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/models/summary_model.dart';
import 'package:kitty/repository/transaction_repository.dart';
import 'package:kitty/resources/app_icons.dart';

class TopContainer extends StatefulWidget {
  const TopContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<TopContainer> createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer> {
  int? totInc;
  int? totExp;
  int totBalance() {
    return totInc! - totExp!;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: KittyRepository().totalExpense(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final List<SummaryModel> totalExpensive =
              snapshot.data as List<SummaryModel>;
          totExp = totalExpensive.first.expensive;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppIcons.expenses),
                  ),
                  Text(
                    totalExpensive.first.expensive.toString(),
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  const Text(
                    'Expense',
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppIcons.balance)),
                  Text(
                    '${totInc! - totExp!}',
                    style: const TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  const Text('Balance'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppIcons.income)),
                  FutureBuilder(
                      future: KittyRepository().totalIncome(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final List<SummaryModel> totalIncome =
                            snapshot.data as List<SummaryModel>;

                        totInc = totalIncome.first.income;
                        return Text(
                          totalIncome.first.income.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        );
                      }),
                  const Text('Income')
                ],
              ),
            ],
          );
        });
  }
}
