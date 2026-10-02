import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

/// Single injection point for Firebase singletons.
///
/// Services depend on this rather than on `FirebaseFirestore.instance` directly
/// so that tests can swap a fake client in via injectable test environments.
@lazySingleton
class FirebaseClient {
  FirebaseClient({
    FirebaseAuth? auth,
    FirebaseFirestore? firestore,
    FirebaseFunctions? functions,
    FirebaseStorage? storage,
    FirebaseRemoteConfig? remoteConfig,
  }) : auth = auth ?? FirebaseAuth.instance,
       firestore = firestore ?? FirebaseFirestore.instance,
       functions = functions ?? FirebaseFunctions.instance,
       storage = storage ?? FirebaseStorage.instance,
       remoteConfig = remoteConfig ?? FirebaseRemoteConfig.instance;

  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final FirebaseFunctions functions;
  final FirebaseStorage storage;
  final FirebaseRemoteConfig remoteConfig;
}
