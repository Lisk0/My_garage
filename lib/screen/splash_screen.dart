import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

import './garage_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) {
            return const GarageScreen();
          },
        ),
      );
    });
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Text(
              'My garage',
              style: GoogleFonts.merriweather(
                fontSize: 64,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 2.5,
              bottom: 8,
            ),
            child: Column(
              children: [
                Text(
                  'Nemanja Lisinac',
                  style: GoogleFonts.gideonRoman(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  '2022',
                  style: GoogleFonts.gideonRoman(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
