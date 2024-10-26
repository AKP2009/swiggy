import 'package:flutter/material.dart';
import 'dart:async';

import 'package:swiggy/login_Page.dart';

class Secondlandingpage extends StatefulWidget {
  @override
  _SecondlandingpageState createState() => _SecondlandingpageState();
}

class _SecondlandingpageState extends State<Secondlandingpage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1000), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFFFF7900),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
              width: double.infinity,
            ),
            Container(
              padding: const EdgeInsets.all(
                  10), // Adds space between the image and the border
              decoration: BoxDecoration(
                color: Colors.white, // White background for the border
                shape:
                    BoxShape.rectangle, // Ensures the container is a rectangle
                borderRadius: BorderRadius.circular(15), // Rounds the corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.1), // Optional: subtle shadow for depth
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    15), // Ensures the image corners match the container
                child: Image.asset(
                  'assets/logo.png', // Replace with your image path
                  width: 50, // Adjust size as needed
                  height: 50, // Adjust size as needed
                  fit: BoxFit.cover,
                ),
              ),
            ),//was not able to get same logo so took screenshot from phone but this is alternative way
            //Image.asset('assets/logo2.png',height: 50,width: 50,),
            const SizedBox(
              height: 10,
              width: double.infinity,
            ),
            const Text("Swiggy",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30, 
            ),),
            const SizedBox(
              height: 50,
              width: double.infinity,
            ),
            Image.asset('assets/secondpage.png',width: double.infinity,),//took screenshot since idk how to make that and its not matching with background
            const SizedBox(height: 20),
            const Text(
              'One app for food,\ngrocery,dining & more\n in minutes!',
              style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontSize: 30, 
            ),
            textAlign: TextAlign.center,
            ),
            const SizedBox(width: double.infinity,height: 100,),
            Container(
              width: 375,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2), // Increase opacity
                  borderRadius: BorderRadius.circular(10.0), // Rounded edges
                ),
                padding: const EdgeInsets.all(20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text(
                        '10+ Crore',
                          style: TextStyle(
                           color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                         ),
                       ),
                      SizedBox(height: 10.0),
                      Text(
                        'Happy Users',
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                    ),
                    ),
                    ],
                 ),
                    Container(
                        height: 50.0, // Adjust height as needed to match text height
                        width: 2.0,
                        color: Colors.white,
                      ),
                      
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '300+ Crore',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Orders Delivered',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      
                      // Divider with limited height
                      Container(
                        height: 50.0, // Adjust height as needed to match text height
                        width: 2.0,
                        color: Colors.white,
                      ),
                      
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '650+',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Cities in India',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )

          ],
        ),
      ),
    );
  }
}
