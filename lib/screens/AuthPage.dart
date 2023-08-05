import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:get/get.dart';
import 'package:iccycream/screens/SignUpPage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final TextEditingController _Emailcontroller = TextEditingController();
  final TextEditingController _Passwordcontroller = TextEditingController();
  final firebase = FirebaseAuth.instance;

  @override
  void dispose() {
    _Emailcontroller.dispose();
    _Passwordcontroller.dispose();
    super.dispose();
  }

  bool validate() {
    if (!GetUtils.isEmail(_Emailcontroller.value.text)) {
      return false;
    }
    if (_Passwordcontroller.value.text.isEmpty) {
      print(_Passwordcontroller.value.text);
      return false;
    }
    return true;
  }

  void Signingin() async {
    if (validate() == true) {
      try {
        final usercredentials = await firebase.signInWithEmailAndPassword(
            email: _Emailcontroller.value.text,
            password: _Passwordcontroller.value.text);
      } on FirebaseAuthException catch (error) {
        if (error.code == 'email-already-in-use') {}
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.message ?? 'Authentication Failed')));
      }
    } else {
      Get.snackbar(
        "Invalid Input: ",
        "Your Input is incorrect",
        icon: const Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void _signInWithGoogle() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        color: Colors.black,
        height: double.maxFinite,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              Image.asset(
                'assets/images/icecreampng.png',
                width: 277,
                height: 262,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: GlassContainer(
                  height: 400,
                  width: double.maxFinite,
                  blur: 10,
                  color: Colors.white.withOpacity(0.2),
                  //--code to remove border
                  border: const Border.fromBorderSide(BorderSide.none),
                  shadowStrength: 5,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _Emailcontroller,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            filled: true,
                            fillColor: Color.fromARGB(38, 255, 255, 255),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Enter your email here',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(182, 255, 255, 255),
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _Passwordcontroller,
                          style: const TextStyle(
                            color: Color.fromARGB(185, 255, 255, 255),
                          ),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            filled: true,
                            fillColor: Color.fromARGB(38, 255, 255, 255),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Enter your password here',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(173, 255, 255, 255),
                                fontWeight: FontWeight.w300,
                                fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: Signingin,
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF8E588),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  letterSpacing: 3),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(const SignUp(),
                                    transition: Transition.fade,
                                    duration:
                                        const Duration(milliseconds: 500));
                              },
                              child: const Text(
                                'Forgot Your Password?',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'OR',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          height: 50,
                          decoration: ShapeDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: InkWell(
                            onTap: _signInWithGoogle,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/GPNG.png',
                                  height: 40,
                                  width: 40,
                                ),
                                const Text(
                                  'Continue with Google',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                const SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
