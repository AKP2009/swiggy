import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swiggy/Otp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    phoneController.dispose(); // Dispose the controller when done
    super.dispose();
  }

  // Method to validate phone number format
  bool isValidPhoneNumber(String phone) {
    RegExp regExp = RegExp(r'^\+\d{1,3}\d{1,14}$'); // E.164 format
    return regExp.hasMatch(phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Phone Authentication",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            TextField(
              keyboardType: TextInputType.phone,
              controller: phoneController,
              decoration: InputDecoration(
                fillColor: Colors.grey.withOpacity(0.25),
                filled: true,
                hintText: "Enter Phone (+CountryCode PhoneNumber)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      String phone = phoneController.text.trim();

                      // Validate phone number format
                      if (!isValidPhoneNumber(phone)) {
                        setState(() {
                          isLoading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Please enter a valid phone number in the format +CountryCode PhoneNumber.'),
                          ),
                        );
                        return;
                      }

                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: phone,
                        verificationCompleted: (phoneAuthCredential) {
                          // Auto-retrieval completed, handle the credential
                          log('Verification completed: ${phoneAuthCredential.smsCode}');
                        },
                        verificationFailed: (error) {
                          log('Verification failed: ${error.message}');
                          setState(() {
                            isLoading = false; // Stop loading on error
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(error.message ?? 'Error occurred')),
                          );
                        },
                        codeSent: (verificationId, forceResendingToken) {
                          setState(() {
                            isLoading = false; // Stop loading after code is sent
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OTPScreen(
                                verificationId: verificationId,
                              ),
                            ),
                          );
                        },
                        codeAutoRetrievalTimeout: (verificationId) {
                          log("Auto retrieval timeout for: $verificationId");
                          setState(() {
                            isLoading = false; // Stop loading on timeout
                          });
                        },
                      );
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
