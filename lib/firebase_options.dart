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
    apiKey: 'AIzaSyD3a4ETTbHuL6RcRsCdBRZQshYYCuGX_-8',
    appId: '1:344927391387:web:5f8537123047b8ce08c03e',
    messagingSenderId: '344927391387',
    projectId: 'emart-bbb09',
    authDomain: 'emart-bbb09.firebaseapp.com',
    storageBucket: 'emart-bbb09.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQDhh9Cw5e_M1tSw26BNCsX27N0Zryfcs',
    appId: '1:344927391387:android:c716ffcd54fe5d2908c03e',
    messagingSenderId: '344927391387',
    projectId: 'emart-bbb09',
    storageBucket: 'emart-bbb09.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyClZbhj62QU7ERc3KMFyUBXIFTwzy0GPJk',
    appId: '1:344927391387:ios:bae22cfc7454489a08c03e',
    messagingSenderId: '344927391387',
    projectId: 'emart-bbb09',
    storageBucket: 'emart-bbb09.appspot.com',
    iosClientId:
        '344927391387-bfeld7pm01ujk83sq2d7uj3b6n0m2392.apps.googleusercontent.com',
    iosBundleId: 'com.example.emart',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyClZbhj62QU7ERc3KMFyUBXIFTwzy0GPJk',
    appId: '1:344927391387:ios:b122dd2b961afe4308c03e',
    messagingSenderId: '344927391387',
    projectId: 'emart-bbb09',
    storageBucket: 'emart-bbb09.appspot.com',
    iosClientId:
        '344927391387-mm1vgsk22adil5fkc7pnp8h58h9f7l87.apps.googleusercontent.com',
    iosBundleId: 'com.example.emart.RunnerTests',
  );
}
