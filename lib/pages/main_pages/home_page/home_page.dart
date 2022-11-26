import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitty/pages/main_pages/add_new_page/add_new_page.dart';
import 'package:kitty/pages/main_pages/home_page/widgets/container_for_list.dart';
import 'package:kitty/pages/main_pages/home_page/widgets/top_container.dart';
import 'package:kitty/pages/main_pages/home_page/widgets/transaction_builder.dart';
import 'package:kitty/pages/main_pages/search_page/search_page.dart';
import 'package:kitty/resources/app_icons.dart';
import 'package:kitty/widgets/uncategorized/data_picker/bloc/main_screen_bloc.dart';
import 'package:kitty/widgets/uncategorized/data_picker/date_picker.dart';
import '../../../widgets/uncategorized/data_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = DataWidgetState.selectedData;
  @override
  void initState() {
    context.read<MainScreenBloc>().add(GetMonthEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWeight = MediaQuery.of(context).size.width;
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      builder: (context, state) {
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
                        onPressed: () {
                          Navigator.pushNamed(context, SearchPage.routeName);
                        },
                        icon: SvgPicture.asset(AppIcons.search)),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const DatePicker(),
                    Container(
                      height: screenHeight * 0.14,
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
                    state.selectedMonth == '11'
                        ? ContainerForList(
                            screenHeight: screenHeight,
                            screenWeight: screenWeight,
                            child: TodayTransactionBuilder(
                                child: const TransactionBuilder()),
                          )
                        : Container(),
                    ContainerForList(
                      screenHeight: screenHeight,
                      screenWeight: screenWeight,
                      child: const TransactionBuilder(),
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
      },
    );
  }
}
