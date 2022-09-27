import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitty/pages/main_pages/report_page/widgets/custom_progress_indicator.dart';

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
                    onPressed: () {},
                    icon: Image.asset('assets/icons/Vector (3).png')),
                const SizedBox(width: 2),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/Vector (10).png')),
                // const SizedBox(width: 25)
              ],
            ),
          ]),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DataWidget(),
              Text(
                'Overview'.toUpperCase(),
              ),
              const CustomProgressIndicator(),
            ],
          )
        ],
      ),
    );
  }
}
