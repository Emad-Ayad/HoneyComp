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
    apiKey: 'AIzaSyDK_t0SUXBuvnYYNf9ziUOxCzAhDoVCZG4',
    appId: '1:929584401155:web:e9588c4187440037f23736',
    messagingSenderId: '929584401155',
    projectId: 'honey-comp',
    authDomain: 'honey-comp.firebaseapp.com',
    storageBucket: 'honey-comp.firebasestorage.app',
    measurementId: 'G-4YG483ZS4H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBFeh-0EX5iOhXj3fpVb2ryvIYVMdoeW7s',
    appId: '1:929584401155:android:93456a2d7fef8c49f23736',
    messagingSenderId: '929584401155',
    projectId: 'honey-comp',
    storageBucket: 'honey-comp.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2ZDtgV_mf2CEejaz0z5cp38bdTwtq0VE',
    appId: '1:929584401155:ios:c50cc04b5339edeef23736',
    messagingSenderId: '929584401155',
    projectId: 'honey-comp',
    storageBucket: 'honey-comp.firebasestorage.app',
    iosBundleId: 'com.example.honeyComp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC2ZDtgV_mf2CEejaz0z5cp38bdTwtq0VE',
    appId: '1:929584401155:ios:c50cc04b5339edeef23736',
    messagingSenderId: '929584401155',
    projectId: 'honey-comp',
    storageBucket: 'honey-comp.firebasestorage.app',
    iosBundleId: 'com.example.honeyComp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDK_t0SUXBuvnYYNf9ziUOxCzAhDoVCZG4',
    appId: '1:929584401155:web:d334b3d0da04d3ebf23736',
    messagingSenderId: '929584401155',
    projectId: 'honey-comp',
    authDomain: 'honey-comp.firebaseapp.com',
    storageBucket: 'honey-comp.firebasestorage.app',
    measurementId: 'G-N1KJV844BS',
  );
}
