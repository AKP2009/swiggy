import 'package:flutter/material.dart';
import 'package:swiggy/LandingPage/FirstLandingPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'OtpAUuth/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Firstlandingpage(),
    );
  }
}
