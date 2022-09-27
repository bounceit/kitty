import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/uncategorized/data_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWeight = MediaQuery.of(context).size.width;
    final List<String> category = <String>[
      'еда',
      'вода',
      'питье',
      'одежда',
      'игры'
    ];
    final List<String> transaction = <String>[
      'суп',
      'кола',
      'водка',
      'джинсы',
      'дота'
    ];
    final List<int> entries = <int>[100, 200, 300, 400, 500];

    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'assets/images/Kitty-Logo.png',
                height: 24,
                width: 24,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Kitty',
                style: GoogleFonts.inter(
                    color: Colors.black, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/Vector (3).png')),
                const SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(50)),
                  height: 24,
                  width: 24,
                  child: Text(
                    'M',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 32,
                )
              ],
            ),
          ],
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const DataWidget(),
                Container(
                  height: screenHeight * 0.125,
                  width: screenWeight * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1.5, color: Colors.grey.shade300),
                  ),
                  child: const TopContainer(
                    balance: '300',
                    expense: '500',
                    income: '100',
                  ),
                ),
                FirstList(
                  screenHeight: screenHeight,
                  screenWeight: screenWeight,
                  entries: entries,
                  category: category,
                  transaction: transaction,
                ),
                SecondList(
                  screenHeight: screenHeight,
                  screenWeight: screenWeight,
                  entries: entries,
                  category: category,
                  transaction: transaction,
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      maximumSize:
                          MaterialStateProperty.all<Size>(const Size(130, 50))),
                  onPressed: () {},
                  child: Row(
                    children: const [Icon(Icons.add_sharp), Text('Add New')],
                  )),
            )
          ],
        ));
  }
}

class SecondList extends StatelessWidget {
  const SecondList({
    Key? key,
    required this.screenHeight,
    required this.screenWeight,
    required this.entries,
    required this.category,
    required this.transaction,
  }) : super(key: key);

  final double screenHeight;
  final double screenWeight;
  final List<int> entries;
  final List<String> category;
  final List<String> transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: screenHeight * 0.3,
        width: screenWeight * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1.5, color: Colors.grey.shade300),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              color: Colors.transparent,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: screenWeight,
                height: 50,
                padding: const EdgeInsets.all(6),
                // color: Colors.amber[colorCodes[index]],
                // child: Center(child: Text(' ${entries[index]}')),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.green[300],
                          borderRadius: BorderRadius.circular(50)),
                      child: const Icon(Icons.health_and_safety),
                    ),
                    Column(
                      children: [
                        Text(' ${category[index]}'),
                        Text(' ${transaction[index]}')
                      ],
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        child: Text(' ${entries[index]}'))
                  ],
                ),
              );
            },
          ),
        ));
  }
}

class FirstList extends StatelessWidget {
  const FirstList({
    Key? key,
    required this.screenHeight,
    required this.screenWeight,
    required this.entries,
    required this.category,
    required this.transaction,
  }) : super(key: key);

  final double screenHeight;
  final double screenWeight;
  final List<int> entries;
  final List<String> category;
  final List<String> transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: screenHeight * 0.3,
        width: screenWeight * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1.5, color: Colors.grey.shade300),
        ),
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(
            color: Colors.transparent,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: screenWeight,
              height: 50,
              padding: const EdgeInsets.all(6),
              // color: Colors.amber[colorCodes[index]],
              // child: Center(child: Text(' ${entries[index]}')),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.green[300],
                        borderRadius: BorderRadius.circular(50)),
                    child: const Icon(Icons.health_and_safety),
                  ),
                  Column(
                    children: [
                      Text(' ${category[index]}'),
                      Text(' ${transaction[index]}')
                    ],
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      child: Text(' ${entries[index]}'))
                ],
              ),
            );
          },
        ));
  }
}

class TopContainer extends StatelessWidget {
  const TopContainer({
    Key? key,
    required this.balance,
    required this.income,
    required this.expense,
  }) : super(key: key);
  final String balance;
  final String income;
  final String expense;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/Vector (7).png'),
            ),
            Text(
              expense + '',
              style: const TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            Text(
              'Expense',
              style: GoogleFonts.inter(),
            )
          ],
        ),
        Column(
          children: [
            IconButton(
                onPressed: () {},
                icon: Image.asset('assets/icons/Vector (8).png')),
            Text(
              balance,
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
                icon: Image.asset('assets/icons/Vector (9).png')),
            Text(
              income,
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
