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
    apiKey: 'AIzaSyCFSTDCJ1REgZfcS-6v12Wp7vRINp2or7s',
    appId: '1:1048493622652:web:c4c9b11465ee07fe34d0f9',
    messagingSenderId: '1048493622652',
    projectId: 'todo-app-494ae',
    authDomain: 'todo-app-494ae.firebaseapp.com',
    storageBucket: 'todo-app-494ae.appspot.com',
    measurementId: 'G-853RWQH24Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnII_a2eqmSo71qPxLcfyYGF8MBIXXjWM',
    appId: '1:1048493622652:android:5c50a34190e057e134d0f9',
    messagingSenderId: '1048493622652',
    projectId: 'todo-app-494ae',
    storageBucket: 'todo-app-494ae.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDH70ctKVPyNpw3RXR0bT7ErG_pE4sNMGE',
    appId: '1:1048493622652:ios:ffec10a44dbad31734d0f9',
    messagingSenderId: '1048493622652',
    projectId: 'todo-app-494ae',
    storageBucket: 'todo-app-494ae.appspot.com',
    iosClientId: '1048493622652-1m5alaib7qjo7c9lrosndutuau6atohl.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDH70ctKVPyNpw3RXR0bT7ErG_pE4sNMGE',
    appId: '1:1048493622652:ios:f5405d553e04b72434d0f9',
    messagingSenderId: '1048493622652',
    projectId: 'todo-app-494ae',
    storageBucket: 'todo-app-494ae.appspot.com',
    iosClientId: '1048493622652-1dv54qaaet0jl0kq06e3enh13hetleaq.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoApp.RunnerTests',
  );
}