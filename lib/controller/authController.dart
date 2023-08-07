import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:iccycream/screens/AuthPage.dart';
import 'package:iccycream/screens/WelcomePage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iccycream/screens/getStarted.dart';
import 'package:iccycream/models/user.dart';
import 'package:iccycream/controller/userController.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  FirebaseAuth _auth = FirebaseAuth.instance;
  late Rx<User?> _firebaseUser;
  Users users = const Users();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.authStateChanges());
    ever(_firebaseUser, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(const AuthenticationScreen(), transition: Transition.fadeIn);
    } else {
      users = Users(
          uid: user.uid, username: user.displayName, email: user.displayName);
      print('Username is');
      print(user.displayName);
      Get.offAll(
          WelcomeScreen(
            user: users,
          ),
          transition: Transition.fadeIn);
    }
  }

  void signUp(String username, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _firebaseUser.value != null
          ? Get.offAll(WelcomeScreen(
              user: Users(username: username),
            ))
          : Get.to(const StartScreen());
      String uid = _auth.currentUser!.uid;
      users = Users(uid: uid, username: username, email: email);
      UserController().addUserToCollection(uid, username, email);
    } catch (e) {
      Get.snackbar("Error creating account", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _firebaseUser.value != null
          ? Get.offAll(const WelcomeScreen())
          : Get.to(const AuthenticationScreen());
    } catch (e) {
      Get.snackbar("Error signing in", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      Get.snackbar("Error signing out", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication googleAuth = await googleuser!.authentication;
      AuthCredential credential = await GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await _auth.signInWithCredential(credential);

      String uid = _auth.currentUser!.uid;
      String? username = _auth.currentUser!.displayName;
      String? email = _auth.currentUser!.email;
      users = Users(uid: uid, username: username!, email: email!);
      UserController().addUserToCollection(uid, username, email);
    } catch (e) {
      print(e);
    }
  }

  void signOutWithGoogle() async {
    try {
      await GoogleSignIn().signOut();
    } catch (e) {
      print(e);
    }
  }
}
