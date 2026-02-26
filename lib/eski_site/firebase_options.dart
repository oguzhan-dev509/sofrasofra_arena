// ignore_for_file: lines_longer_than_80_chars, avoid_classes_on_data_providers
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// 🏛️ İMPARATORLUK FİREBASE YAPILANDIRMASI
/// Bu dosya Arena ve Eski Site arasındaki köprüyü kurar.
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.ios:
        return ios;
      default:
        throw UnsupportedError(
          'Bu platform için Firebase yapılandırması bulunamadı.',
        );
    }
  }

  // 🌍 WEB YAPILANDIRMASI (Senin mevcut ayarların buraya gelecek)
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'BURAYA_KENDİ_API_KEYİNİ_YAZ',
    authDomain: 'sofrasofra-arena.firebaseapp.com',
    projectId: 'sofrasofra-arena',
    storageBucket: 'sofrasofra-arena.appspot.com',
    messagingSenderId: 'SENDER_ID',
    appId: 'APP_ID',
    measurementId: 'G-MEASUREMENT_ID',
  );

  // 🤖 ANDROID YAPILANDIRMASI
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'BURAYA_KENDİ_API_KEYİNİ_YAZ',
    appId: 'ANDROID_APP_ID',
    messagingSenderId: 'SENDER_ID',
    projectId: 'sofrasofra-arena',
    storageBucket: 'sofrasofra-arena.appspot.com',
  );

  // 🍎 IOS YAPILANDIRMASI
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'BURAYA_KENDİ_API_KEYİNİ_YAZ',
    appId: 'IOS_APP_ID',
    messagingSenderId: 'SENDER_ID',
    projectId: 'sofrasofra-arena',
    storageBucket: 'sofrasofra-arena.appspot.com',
    iosBundleId: 'com.example.sofrasofra',
  );
}
