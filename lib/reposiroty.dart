import 'package:firebase_auth/firebase_auth.dart';

class Repository {
  static final Repository _instance = Repository._internal();

  Repository._internal();

  factory Repository() {
    return _instance;
  }

  bool get isLogin => FirebaseAuth.instance.currentUser != null;
}
