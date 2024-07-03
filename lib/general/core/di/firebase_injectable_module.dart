// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:sree_balagi_gold/firebase_options.dart';

import 'app_injectable_module.dart';

@module
abstract class FirebaseInjectableModule {
  @preResolve
  Future<FirebaseServeice> get firebaseServeice => FirebaseServeice.init();

  @preResolve
  Future<PermissionServeice> get permissionServeice =>
      PermissionServeice.init();

  @lazySingleton
  FirebaseAuth get auth => FirebaseAuth.instance;

  @lazySingleton
  FirebaseStorage get storage => FirebaseStorage.instance;

  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @lazySingleton
  FirebaseMessaging get fcm => FirebaseMessaging.instance;
}

class FirebaseServeice {
  static Future<FirebaseServeice> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return FirebaseServeice();
  }
}
