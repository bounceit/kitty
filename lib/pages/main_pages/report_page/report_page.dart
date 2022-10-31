import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitty/models/report_model.dart';
import 'package:kitty/repository/transaction_repository.dart';
import 'package:kitty/resources/app_colors.dart';
import 'package:kitty/resources/app_icons.dart';

import '../../../widgets/uncategorized/data_container.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);
  static const routeName = '/report_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Statistics',
            style: GoogleFonts.inter(
                color: Colors.black, fontWeight: FontWeight.w700),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {}, icon: SvgPicture.asset(AppIcons.search)),
                const SizedBox(width: 2),
                IconButton(
                    onPressed: () {}, icon: SvgPicture.asset(AppIcons.tool)),
                // const SizedBox(width: 25)
              ],
            ),
          ]),
      body: Stack(
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DataWidget(),
              Text(
                'Overview'.toUpperCase(),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 36,
                      child: ColoredBox(
                        color: Colors.amber,
                        child: Text(''),
                      ),
                    ),
                    Expanded(
                      flex: 30,
                      child: ColoredBox(
                        color: Colors.red,
                        child: Text(''),
                      ),
                    ),
                    Expanded(
                      flex: 20,
                      child: ColoredBox(
                        color: Colors.blue,
                        child: Text(''),
                      ),
                    ),
                    Expanded(
                        flex: 10,
                        child: ColoredBox(
                          color: Colors.green,
                          child: Text(''),
                        )),
                  ],
                ),
              ),
              Text(
                'details'.toUpperCase(),
              ),
              Expanded(
                child: FutureBuilder(
                    future: KittyRepository().report(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final List<ReportModel> transaction =
                          snapshot.data as List<ReportModel>;

                      return ListView.builder(
                          itemCount: transaction.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: AppColors.appBarAddPage,
                              child: ListTile(
                                trailing: Text(
                                  '${transaction[index].totalAmount}',
                                  style: const TextStyle(color: Colors.red),
                                ),
                                leading: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.green[300],
                                      borderRadius: BorderRadius.circular(50)),
                                  child: SvgPicture.asset(transaction[index]
                                      .categoryIcon
                                      .toString()),
                                ),
                                subtitle: Text(transaction[index].title),
                                title: Text(
                                  transaction[index].categoryName,
                                ),
                              ),
                            );
                          });
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
