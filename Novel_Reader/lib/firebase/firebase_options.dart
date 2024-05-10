// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBl3KpKoprVLvL1N50xSUVlhaeGQp-wDlY',
    appId: '1:949332932145:web:cc4e5c93d0c331e2f54710',
    messagingSenderId: '949332932145',
    projectId: 'novelreader-a9018',
    authDomain: 'novelreader-a9018.firebaseapp.com',
    databaseURL: 'https://novelreader-a9018-default-rtdb.firebaseio.com',
    storageBucket: 'novelreader-a9018.appspot.com',
    measurementId: 'G-CBRMWT0LBJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0d69oRNqfQd0D5bAzQbbvbkfmn1LMt5c',
    appId: '1:949332932145:android:afc52119593ae84ef54710',
    messagingSenderId: '949332932145',
    projectId: 'novelreader-a9018',
    databaseURL: 'https://novelreader-a9018-default-rtdb.firebaseio.com',
    storageBucket: 'novelreader-a9018.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpq8kBhOPq6G2B20R4cs1JelNJHMRmXKM',
    appId: '1:949332932145:ios:de90e47e2f414a65f54710',
    messagingSenderId: '949332932145',
    projectId: 'novelreader-a9018',
    databaseURL: 'https://novelreader-a9018-default-rtdb.firebaseio.com',
    storageBucket: 'novelreader-a9018.appspot.com',
    iosBundleId: 'com.example.project4',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCpq8kBhOPq6G2B20R4cs1JelNJHMRmXKM',
    appId: '1:949332932145:ios:f58b093fb60bc7f5f54710',
    messagingSenderId: '949332932145',
    projectId: 'novelreader-a9018',
    databaseURL: 'https://novelreader-a9018-default-rtdb.firebaseio.com',
    storageBucket: 'novelreader-a9018.appspot.com',
    iosBundleId: 'com.example.project4.RunnerTests',
  );
}
