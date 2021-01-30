import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class Logger {
  static Future<void> initializeFlutterFire() async {
    // Wait for Firebase to initialize
    await Firebase.initializeApp();

    // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

    // Pass all uncaught errors to Crashlytics.
    Function originalOnError = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails errorDetails) async {
      //await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);

      originalOnError(errorDetails);
    };
  }

  static Future<void> recordError(
      dynamic e, StackTrace s, String reason) async {
    // await FirebaseCrashlytics.instance.recordError(e, s, reason: reason);
  }
}
