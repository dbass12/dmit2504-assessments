// ignore_for_file: avoid_print, use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cinemasync/services/ratings-db.dart';

class Authorization {
  User? currentUser = FirebaseAuth.instance.currentUser;

  void listen() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('Auth listen; No User');
      } else {
        print('Auth listen: email= ${user.email} name= ${user.displayName}');
      }
    });
  }

  Future<void> createUser(String name, String email, String password) async {
    try {
      print('Auth createUser: TRY');
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password);
      await credential.user?.updateDisplayName(name);
      User? user = FirebaseAuth.instance.currentUser;
      await RatingsDB()
          .createNewUser(user?.uid, user?.displayName, user?.email);
      print('signed up with ${user?.displayName}');
    } catch (e) {
      print('Auth createUser: CATCH $e');
    }
  }

  Future<void> logIn(String email, String password) async {
    try {
      print('Auth logIn: TRY');
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.trim(), password: password);
      print('logIn with ${email.trim()}');
    } catch (e) {
      print('Auth logIn: CATCH $e');
    }
  }

  Future<void> logOut() async {
    try {
      print('Auth logOut: TRY');
      await FirebaseAuth.instance.signOut();
      print('logged out');
    } catch (e) {
      print('Auth logOut: CATCH $e');
    }
  }
}
