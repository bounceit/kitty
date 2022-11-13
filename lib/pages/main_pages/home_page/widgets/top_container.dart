import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/models/summary_model.dart';
import 'package:kitty/pages/main_pages/home_page/widgets/bloc/total_bloc.dart';
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
  // Future<List> totalInc = KittyRepository().totalIncome();

  final TotalBloc _newsBloc = TotalBloc();

  @override
  void initState() {
    _newsBloc.add(GetTotalList());
    super.initState();
  }

  int totExp = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TotalBloc()
        ..add(
          GetTotalList(),
        ),
      child: BlocListener<TotalBloc, TotalState>(
        listener: (context, state) {
          if (state is TotalError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
              ),
            );
          }
        },
        child: BlocBuilder<TotalBloc, TotalState>(
          builder: (context, state) {
            if (state is TotalInitial) {
              return _buildLoading();
            } else if (state is TotalLoading) {
              return _buildLoading();
            } else if (state is TotalLoaded) {
              return _buildCard(context, state.summuryModel, state.summaryExp);
            } else if (state is TotalError) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  Widget _buildCard(
    BuildContext context,
    SummaryModel income,
    SummaryModel expamsive,
  ) {
    int balance = income.income - expamsive.expensive;
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
              expamsive.expensive.toString(),
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
                onPressed: () {}, icon: SvgPicture.asset(AppIcons.balance)),
            balance <= 0
                ? Text(
                    '$balance',
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  )
                : Text(
                    '$balance',
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
                onPressed: () {}, icon: SvgPicture.asset(AppIcons.income)),
            Text(
              income.income.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            const Text('Income')
          ],
        ),
      ],
    );
  }
}
//             return FutureBuilder(
//                 future: KittyRepository().totalExpense(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState != ConnectionState.done) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   final List<SummaryModel> totalExpensive =
//                       snapshot.data as List<SummaryModel>;
//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Column(
//                         children: [
//                           IconButton(
//                             onPressed: () {},
//                             icon: SvgPicture.asset(AppIcons.expenses),
//                           ),
//                           Text(
//                             totalExpensive.first.expensive.toString(),
//                             style: const TextStyle(
//                               color: Colors.redAccent,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 12,
//                             ),
//                           ),
//                           const Text(
//                             'Expense',
//                           )
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           IconButton(
//                               onPressed: () {},
//                               icon: SvgPicture.asset(AppIcons.balance)),
//                           const Text(
//                             '0',
//                             style: TextStyle(
//                               color: Colors.greenAccent,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 12,
//                             ),
//                           ),
//                           const Text('Balance'),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           IconButton(
//                               onPressed: () {},
//                               icon: SvgPicture.asset(AppIcons.income)),
//                           FutureBuilder(
//                               future: KittyRepository().totalIncome(),
//                               builder: (context, snapshot) {
//                                 if (snapshot.connectionState !=
//                                     ConnectionState.done) {
//                                   return const Center(
//                                     child: CircularProgressIndicator(),
//                                   );
//                                 }
//                                 final List<SummaryModel> totalIncome =
//                                     snapshot.data as List<SummaryModel>;

//                                 return Text(
//                                   totalIncome.first.income.toString(),
//                                   style: const TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 12,
//                                   ),
//                                 );
//                               }),
//                           const Text('Income')
//                         ],
//                       ),
//                     ],
//                   );
//                 });
//           },
//         ),
//       ),
//     );
//   }
// }
