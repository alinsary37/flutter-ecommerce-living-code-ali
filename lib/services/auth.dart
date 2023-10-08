import 'package:firebase_auth/firebase_auth.dart';


abstract class AuthBase {
  Future<User?> loginWithEmailAndPassword(String email, String password);
  Future<User?> registerWithEmailAndPassword(String email, String password);
  Future<void> logout();
  Stream<User?> authStateChange();
  User? get currentUser;
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    final userAuth = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return userAuth.user;
  }

  @override
  Future<User?> registerWithEmailAndPassword(String email, String password)async {
    final userAuth =  await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return userAuth.user;
  }

  @override
  Future<void> logout()async => await _firebaseAuth.signOut();

  @override
  Stream<User?> authStateChange() => _firebaseAuth.authStateChanges();

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  }





