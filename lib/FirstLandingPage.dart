import 'dart:async';
import 'package:flutter/material.dart';
import 'package:swiggy/SecondLandingPage.dart';

class Firstlandingpage extends StatefulWidget {
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
      body: Center(
        child: Hero(
            tag: 'hero-logo',
            child: Image.asset('assets/logo.png')),
      ),
    );
  }
}
