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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCZRU3a3DIxr8WI70qCwT6qvLVmlGtMWp4',
    appId: '1:297997434546:web:39a755bea8b74d5d9953ab',
    messagingSenderId: '297997434546',
    projectId: 'party-5bdd1',
    authDomain: 'party-5bdd1.firebaseapp.com',
    storageBucket: 'party-5bdd1.appspot.com',
    measurementId: 'G-FZH0WV9W0H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwBnLqrQwVvB3U8sAp9Z_9d0z-uSI1opQ',
    appId: '1:297997434546:android:a08e67d1cb6fe9bb9953ab',
    messagingSenderId: '297997434546',
    projectId: 'party-5bdd1',
    storageBucket: 'party-5bdd1.appspot.com',
  );
}