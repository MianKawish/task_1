// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCHYj8Rn2obUNllDi82Ru-9ENARkIp2hqU',
    appId: '1:143630061682:web:ef8a5e711c1fdd5517b2eb',
    messagingSenderId: '143630061682',
    projectId: 'task-1-b794f',
    authDomain: 'task-1-b794f.firebaseapp.com',
    storageBucket: 'task-1-b794f.appspot.com',
    measurementId: 'G-VVBPDHMZ8G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDciBZeZLikCWw1lykkBmUWJoPPm6XroAY',
    appId: '1:143630061682:android:5a69ac95b3fbd49917b2eb',
    messagingSenderId: '143630061682',
    projectId: 'task-1-b794f',
    storageBucket: 'task-1-b794f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwmaU7yaXwTn-jiDnl0qPqGsqZ4J8nlKE',
    appId: '1:143630061682:ios:8996edaff8d8bb8417b2eb',
    messagingSenderId: '143630061682',
    projectId: 'task-1-b794f',
    storageBucket: 'task-1-b794f.appspot.com',
    iosBundleId: 'com.kawish.task1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwmaU7yaXwTn-jiDnl0qPqGsqZ4J8nlKE',
    appId: '1:143630061682:ios:8996edaff8d8bb8417b2eb',
    messagingSenderId: '143630061682',
    projectId: 'task-1-b794f',
    storageBucket: 'task-1-b794f.appspot.com',
    iosBundleId: 'com.kawish.task1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCHYj8Rn2obUNllDi82Ru-9ENARkIp2hqU',
    appId: '1:143630061682:web:38804a14d554fe3e17b2eb',
    messagingSenderId: '143630061682',
    projectId: 'task-1-b794f',
    authDomain: 'task-1-b794f.firebaseapp.com',
    storageBucket: 'task-1-b794f.appspot.com',
    measurementId: 'G-VS0W5Y2Y5S',
  );
}
