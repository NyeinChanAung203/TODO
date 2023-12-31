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
    apiKey: 'AIzaSyAegx1p1t5IX9FAjyMxLRSfNJGFHKkgNy8',
    appId: '1:768160683330:web:0648cdcffd5c98937ae4db',
    messagingSenderId: '768160683330',
    projectId: 'todo-cba77',
    authDomain: 'todo-cba77.firebaseapp.com',
    storageBucket: 'todo-cba77.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCzfZPHalmxQqFMbbcO_CnQzwiNGSN770w',
    appId: '1:768160683330:android:568d9b1f0b9887427ae4db',
    messagingSenderId: '768160683330',
    projectId: 'todo-cba77',
    storageBucket: 'todo-cba77.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArNuR70P0pNqkjM1UayEPXK73YbNmBMeA',
    appId: '1:768160683330:ios:11297f2b4f76a9357ae4db',
    messagingSenderId: '768160683330',
    projectId: 'todo-cba77',
    storageBucket: 'todo-cba77.appspot.com',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyArNuR70P0pNqkjM1UayEPXK73YbNmBMeA',
    appId: '1:768160683330:ios:f6e8ec435e373b5b7ae4db',
    messagingSenderId: '768160683330',
    projectId: 'todo-cba77',
    storageBucket: 'todo-cba77.appspot.com',
    iosBundleId: 'com.example.todo.RunnerTests',
  );
}
