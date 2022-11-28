import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitty/pages/main_pages/home_page/widgets/bloc/total_bloc.dart';

class ContainerForList extends StatelessWidget {
  ContainerForList({
    Key? key,
    required this.child,
    required this.screenHeight,
    required this.screenWeight,
  }) : super(key: key);
  Widget child;
  final double screenHeight;
  final double screenWeight;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: screenHeight * 0.25,
        width: screenWeight * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1.5, color: Colors.grey.shade300),
        ),
        child: child);
  }
}

class TodayTransactionBuilder extends StatelessWidget {
  TodayTransactionBuilder({
    required this.child,
    Key? key,
  }) : super(key: key);
  Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TotalBloc()..add(GetTotalList()),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                ),
                BlocBuilder<TotalBloc, TotalState>(
                  builder: (context, state) {
                    if (state is TotalLoaded) {
                      final balance = state.summuryModel.income -
                          state.summaryExp.expensive;
                      if (balance > 0) {
                        return Text(
                          '+$balance',
                          style: TextStyle(color: Colors.grey.shade500),
                        );
                      } else {
                        return Text(
                          '$balance',
                          style: TextStyle(color: Colors.grey.shade500),
                        );
                      }
                    }
                    return Container();
                  },
                )
              ],
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
