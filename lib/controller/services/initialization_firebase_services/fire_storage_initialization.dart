import 'package:firebase_storage/firebase_storage.dart';

/// This class following singleton design pattern for fireStorage initialization.
class FireStorageInitialization {
  static FirebaseStorage? firebaseStorage;

  static FirebaseStorage storageInitialization() =>
      firebaseStorage ?? FirebaseStorage.instance;
}