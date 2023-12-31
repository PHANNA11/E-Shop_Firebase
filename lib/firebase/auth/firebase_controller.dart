import 'package:firebase_auth/firebase_auth.dart';

class FirebaseController {
  final auth = FirebaseAuth.instance;
  Future loginUser(String? email, String? password) async {
    final userData = await auth.signInWithEmailAndPassword(
        email: email!, password: password!);
    return userData;
  }

  Future logOut() async {
    return await auth.signOut();
  }

  Future createUser(String? email, String? password) async {
    return await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
