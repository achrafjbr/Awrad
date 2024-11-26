import 'package:cloud_firestore/cloud_firestore.dart';
import 'fire_store_initialization.dart';

class BatchWriteInitialization {
  /// Private Constructor
  BatchWriteInitialization._();

  static WriteBatch? batch;

  static WriteBatch writeBatchInitialization() =>
      batch ?? FireStoreInitialization.fireStoreInitialization().batch();
}
