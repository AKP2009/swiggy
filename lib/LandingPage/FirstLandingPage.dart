import 'dart:async';
import 'package:flutter/material.dart';
import 'package:swiggy/LandingPage/SecondLandingPage.dart';

class Firstlandingpage extends StatefulWidget {
  Firstlandingpage({super.key});
  @override
  _firstlandingpageState createState() => _firstlandingpageState();
}

class _firstlandingpageState extends State<Firstlandingpage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 500), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Secondlandingpage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset('assets/logo.png')),
    );
  }
}
