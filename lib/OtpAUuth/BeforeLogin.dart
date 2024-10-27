import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swiggy/OtpAUuth/login_Page.dart';

class BeforeLogin extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xFFF5F5F5),
              padding: EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    right: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BeforeLogin(),
                          ),
                        );
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LIVE",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD3D3D3),
                          ),
                        ),
                        Text(
                          "FOR",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD3D3D3),
                          ),
                        ),
                        Text(
                          "FOOD",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD3D3D3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ACCOUNT",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Login/Create Account to manage orders",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 196, 194, 194),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: const Size(double.infinity, 50),
                      padding: EdgeInsets.zero,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.zero, 
                      ),
                    ),
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text.rich(
                    TextSpan(
                      text: "By clicking, I accept the ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 196, 194, 194),
                      ),
                      children: [
                        TextSpan(
                          text: "Terms & Conditions",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: " and ",
                        ),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(color: Colors.black),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: Text("Offers"),
                  ),
                  SizedBox(height: 10),
                  Divider(color: Colors.black.withOpacity(0.5)),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Send Feedback"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
