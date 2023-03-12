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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_2a3d2HbLLz73xaDAQSJeGDsuyL9U1H8',
    appId: '1:326426092158:android:95b536ff60178966f96e2f',
    messagingSenderId: '326426092158',
    projectId: 'z0und-380415',
    storageBucket: 'z0und-380415.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDypXNAi-6VPpVL8O-N0mq7ZWXOTSs69nk',
    appId: '1:326426092158:ios:e51464546dc4ef05f96e2f',
    messagingSenderId: '326426092158',
    projectId: 'z0und-380415',
    storageBucket: 'z0und-380415.appspot.com',
    androidClientId:
        '326426092158-s7uaffut3a07k0l9jtilgl0troo2bol0.apps.googleusercontent.com',
    iosClientId:
        '326426092158-f1ktugljkv3m78jcqet1tqonvicbpn87.apps.googleusercontent.com',
    iosBundleId: 'com.h4j4x.z0und',
  );
}