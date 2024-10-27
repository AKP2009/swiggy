import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swiggy/LandingPage/SecondLandingPage.dart';

// Provider to manage loading state for OTP verification
final otpLoadingProvider = StateProvider<bool>((ref) => false);

// Provider for OTP verification
final otpVerificationProvider = Provider((ref) => OTPVerificationService(ref));

class OTPVerificationService {
  final ref;

  OTPVerificationService(this.ref);

  Future<void> verifyOTP(
      String verificationId, String otpCode, BuildContext context) async {
    final isLoading = ref.read(otpLoadingProvider.notifier);
    isLoading.state = true;

    try {
      final credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otpCode);
      
      await FirebaseAuth.instance.signInWithCredential(credential);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Secondlandingpage()),
      );
    } catch (e) {
      log(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP verification failed. Please try again.')),
      );
    } finally {
      isLoading.state = false;
    }
  }
}

class OTPScreen extends ConsumerStatefulWidget {
  const OTPScreen({super.key, required this.verificationId});
  final String verificationId;

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends ConsumerState<OTPScreen> {
  final otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(otpLoadingProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "We have sent an OTP to your phone. Please verify.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                fillColor: Colors.grey.withOpacity(0.25),
                filled: true,
                hintText: "Enter OTP",
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
                      final otpCode = otpController.text.trim();
                      final otpService = ref.read(otpVerificationProvider);

                      otpService.verifyOTP(widget.verificationId, otpCode, context);
                    },
                    child: const Text(
                      "Verify",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
