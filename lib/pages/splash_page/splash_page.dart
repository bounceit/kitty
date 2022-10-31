import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:kitty/pages/main_of_main.dart';
import 'package:kitty/resources/app_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final bool shouldPop = false;

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(
        context,
        MainPage.routeName,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/Kitty-Logo.png'),
              const SizedBox(height: 24),
              Text(
                'Kitty',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    letterSpacing: 0.25,
                    color: Colors.black87),
              ),
              const Text(
                'Your expense manager',
                style: TextStyle(
                  fontWeight: AppFonts.bold,
                  fontSize: 14,
                  letterSpacing: 0.25,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
