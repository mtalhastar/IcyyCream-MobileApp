import 'package:flutter/material.dart';
import 'package:iccycream/screens/getStarted.dart';
import 'package:iccycream/screens/AuthPage.dart';
import 'package:get/get.dart';
import 'package:iccycream/screens/WelcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:iccycream/firebase_options.dart';
import 'package:iccycream/controller/authController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthController()));
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

   MyApp({super.key});
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(home: AuthenticationScreen());
  }
}
