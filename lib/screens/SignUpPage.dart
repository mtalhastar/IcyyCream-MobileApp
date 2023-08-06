import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:get/get.dart';
import 'package:iccycream/screens/WelcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iccycream/controller/authController.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _Usercontroller = TextEditingController();
  final TextEditingController _Emailcontroller = TextEditingController();
  final TextEditingController _Passwordcontroller = TextEditingController();
  final firebase = FirebaseAuth.instance;

  @override
  void dispose() {
    _Usercontroller.dispose();
    _Emailcontroller.dispose();
    _Passwordcontroller.dispose();
    super.dispose();
  }

  bool validate() {
    _Usercontroller.value.text;
    _Emailcontroller.value.text;
    _Passwordcontroller.value.text;

    if (_Usercontroller.value.text.isEmpty) {
      return false;
    }
    if (!GetUtils.isEmail(_Emailcontroller.value.text)) {
      return false;
    }
    if (_Passwordcontroller.value.text.isEmpty) {
      return false;
    }
    return true;
  }

  void SignUp() async {
    if (validate() == true) {
        AuthController.instance.signUp(
            _Emailcontroller.value.text, _Passwordcontroller.value.text);
        }
       else {
      return;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        color: Colors.black,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(children: [
            const SizedBox(
              width: double.infinity,
              height: 800,
            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/icecreampng.png',
                width: 280,
                height: 280,
              ),
            ),
            Positioned(
              top: 250,
              right: 0,
              left: 0,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: GlassContainer(
                  height: 470,
                  width: 400,
                  blur: 10,
                  color: Colors.white.withOpacity(0.2),
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
                          controller: _Usercontroller,
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
                            hintText: 'Enter your username here',
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _Passwordcontroller,
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
                            hintText: 'Enter your password here',
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: SignUp,
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
                              'SIGNUP',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  letterSpacing: 3),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Already Have an account? ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
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
                        InkWell(
                          onTap: AuthController.instance.signInWithGoogle,
                          child: Container(
                            height: 50,
                            decoration: ShapeDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
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
            ),
          ]),
        ),
      ),
    );
  }
}
