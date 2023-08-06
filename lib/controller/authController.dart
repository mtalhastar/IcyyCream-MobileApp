import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:iccycream/screens/AuthPage.dart';
import 'package:iccycream/screens/WelcomePage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iccycream/screens/getStarted.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  FirebaseAuth _auth = FirebaseAuth.instance;
  late Rx<User?> _firebaseUser;

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
      Get.offAll(const AuthenticationScreen(),transition: Transition.fadeIn);
    } else {
      Get.offAll(const WelcomeScreen(),transition: Transition.fadeIn);
    }
  }

  void signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _firebaseUser.value != null
          ? Get.offAll(const WelcomeScreen())
          : Get.to(const StartScreen());
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
      await FirebaseAuth.instance.signInWithCredential(credential);
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
