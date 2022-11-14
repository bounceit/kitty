import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitty/models/report_model.dart';
import 'package:kitty/repository/transaction_repository.dart';
import 'package:kitty/resources/app_colors.dart';
import 'package:kitty/resources/app_icons.dart';

import '../../../widgets/uncategorized/data_container.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);
  static const routeName = '/report_page';

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  int? color;
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
              DataWidget(
                data: '',
              ),
              Text(
                'Overview'.toUpperCase(),
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
                          scrollDirection: Axis.horizontal,
                          itemCount: transaction.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 2,
                              width: MediaQuery.of(context).size.width /
                                  transaction.length,
                              color: Color(transaction[index].color),
                              child: const Text(''),
                            );
                          });
                    }),
              ),
              Text(
                'details'.toUpperCase(),
              ),
              Expanded(
                flex: 10,
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
                                  '-${transaction[index].totalAmount}',
                                  style: const TextStyle(color: Colors.red),
                                ),
                                leading: Container(
                                  // height: 40,
                                  // width: 40,
                                  decoration: BoxDecoration(
                                      color: Color(transaction[index].color),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(transaction[index]
                                        .categoryIcon
                                        .toString()),
                                  ),
                                ),
                                subtitle: Text(
                                    '${transaction[index].agrs.toString()} transactions'),
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
