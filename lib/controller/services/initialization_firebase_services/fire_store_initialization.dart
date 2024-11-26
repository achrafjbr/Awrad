import 'package:cloud_firestore/cloud_firestore.dart';

/// This class following singleton design pattern for fireStore initialization.
class FireStoreInitialization {
  /// Private Constructor
  FireStoreInitialization._();

  static FirebaseFirestore? firebaseFireStore;

  static FirebaseFirestore fireStoreInitialization() =>
      firebaseFireStore ?? FirebaseFirestore.instance;
}
