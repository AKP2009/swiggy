// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' 
show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static  FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCdpQxEKyZ-dw7YTSQOaAJ1IdJMICLicYs',
    appId: '1:760866133304:android:b81271078a5e45470e5dcd',
    messagingSenderId: '760866133304',
    projectId: 'swiggy-cc',
    storageBucket: 'swiggy-cc.appspot.com',
  );

  static  FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA1tapxz5kzhWXEd1nrlR9dwCkzjAF8nPI',
    appId: '1:760866133304:ios:4e75b09ca505f6d00e5dcd',
    messagingSenderId: '760866133304',
    projectId: 'swiggy-cc',
    storageBucket: 'swiggy-cc.appspot.com',
    iosBundleId: 'com.example.swiggy',
  );
}