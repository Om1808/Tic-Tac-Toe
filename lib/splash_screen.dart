import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    toHomePage();
  }

  void toHomePage() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFB0BEC5), // Light Gray
                Color(0xFF78909C), // Medium Gray
                Color(0xFF607D8B), // Dark Gray
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Column(children: [
          Expanded(child: Container()),
          Expanded(
            child: Opacity(
              opacity: 0.7,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/appstore.png'),
                  fit: BoxFit.fitHeight,
                )),
              ),
            ),
          ),
          SizedBox(height: 30,),

          Expanded(
              child: Container(
            child: Text(
              "Tic Tac Toe",
              style:TextStyle(
                fontFamily: 'PressStart2p-Regular' , fontWeight: FontWeight.bold , fontSize: 40
              ) ,
            ),
          )),
        ])
      ]),
    );
  }
}
