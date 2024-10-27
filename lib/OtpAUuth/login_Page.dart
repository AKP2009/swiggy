import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';
import 'package:swiggy/OtpAUuth/Otp.dart';


final isLoadingProvider = StateProvider<bool>((ref) => false);


final phoneVerificationProvider = Provider((ref) {
  return PhoneVerificationService(ref);
});

class PhoneVerificationService {
  final ProviderRef ref;

  PhoneVerificationService(this.ref);

  Future<void> verifyPhoneNumber(String phone, BuildContext context) async {
    final isLoading = ref.read(isLoadingProvider.notifier);

    isLoading.state = true;

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (phoneAuthCredential) {
          log('Verification completed: ${phoneAuthCredential.smsCode}');
        },
        verificationFailed: (error) {
          log('Verification failed: ${error.message}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.message ?? 'Error occurred')),
          );
        },
        codeSent: (verificationId, forceResendingToken) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTPScreen(verificationId: verificationId),
            ),
          );
        },
        codeAutoRetrievalTimeout: (verificationId) {
          log("Auto retrieval timeout for: $verificationId");
        },
      );
    } finally {
      isLoading.state = false;
    }
  }

  bool isValidPhoneNumber(String phone) {
    RegExp regExp = RegExp(r'^\+\d{1,3}\d{1,14}$');
    return regExp.hasMatch(phone);
  }
}

class LoginScreen extends ConsumerWidget {
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(isLoadingProvider);

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Enter Your Phone Number",
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
                        onPressed: () {
                          final phone = phoneController.text.trim();
                          final verificationService =
                              ref.read(phoneVerificationProvider);

                          if (!verificationService.isValidPhoneNumber(phone)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Please enter a valid phone number in the format +CountryCode PhoneNumber.'),
                              ),
                            );
                            return;
                          }

                          verificationService.verifyPhoneNumber(phone, context);
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OTPScreen(verificationId: "hiii"),
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
        ],
      ),
    );
  }
}
