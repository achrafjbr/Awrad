import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationInitialization{

  // Private constructor. just for applying singleton design pattern.
  AuthenticationInitialization._();

  static FirebaseAuth? firebaseAuth;

  static FirebaseAuth authInitialization()=>
      firebaseAuth ?? FirebaseAuth.instance;


}