import 'package:flutter/material.dart';
import 'package:swiggy/FirstLandingPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';  // Add this line to import firebase_options.dart

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Hero Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Firstlandingpage(), // Corrected class name
    );
  }
}