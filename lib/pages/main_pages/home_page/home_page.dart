import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitty/pages/main_pages/add_new_page/add_new_page.dart';
import 'package:kitty/pages/main_pages/home_page/widgets/container_for_list.dart';
import 'package:kitty/pages/main_pages/home_page/widgets/top_container.dart';
import 'package:kitty/repository/transaction_repository.dart';
import 'package:kitty/resources/app_icons.dart';
import '../../../widgets/uncategorized/data_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWeight = MediaQuery.of(context).size.width;
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
                    onPressed: () {}, icon: SvgPicture.asset(AppIcons.search)),
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
                  height: screenHeight * 0.13,
                  width: screenWeight * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 1.5,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: const TopContainer(),
                ),
                ContainerForList(
                  screenHeight: screenHeight,
                  screenWeight: screenWeight,
                ),
                ContainerForList(
                  screenHeight: screenHeight,
                  screenWeight: screenWeight,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: SizedBox(
                  width: 120,
                  child: ElevatedButton(
                      style: const ButtonStyle(),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AddNew.routeName,
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.add_sharp),
                          Text('Add New')
                        ],
                      )),
                ),
              ),
            ),
          ],
        ));
  }
}
