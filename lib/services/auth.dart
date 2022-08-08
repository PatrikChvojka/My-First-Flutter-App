import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on FirebaseUser

  Member? _userFromFirebaseuser(User user) {
    return user != null ? Member(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<Member?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseuser(user!));
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = FirebaseAuth.instance.currentUser;
      return _userFromFirebaseuser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseuser(user!);
    } catch (e) {
      return null;
    }
  }

  // register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      await DatabaseService(uid: user!.uid)
          .updateUserData('0', 'new crew data', 100);

      return _userFromFirebaseuser(user);
    } catch (e) {
      return null;
    }
  }
}
