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
    apiKey: 'AIzaSyCZsUxNe_nH4DRDpZ3jLsF6tXnWw7lsH_w',
    appId: '1:280758116470:web:ec6e1af1219069bba3ff57',
    messagingSenderId: '280758116470',
    projectId: 'crud-45fc4',
    authDomain: 'crud-45fc4.firebaseapp.com',
    storageBucket: 'crud-45fc4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTKiFCH3Y8zBdKTxe1RnUoBv8-V3O2tjQ',
    appId: '1:280758116470:android:68ec23a08c0ec20ba3ff57',
    messagingSenderId: '280758116470',
    projectId: 'crud-45fc4',
    storageBucket: 'crud-45fc4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8rWkH7Be9kvaFCFFfQTIWKJBCYJTZqnk',
    appId: '1:280758116470:ios:8ff18f3d7d210d15a3ff57',
    messagingSenderId: '280758116470',
    projectId: 'crud-45fc4',
    storageBucket: 'crud-45fc4.appspot.com',
    iosBundleId: 'com.example.crud',
  );
}
