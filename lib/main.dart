import 'package:flutter/material.dart';
import 'package:iccycream/controller/favController.dart';
import 'package:iccycream/controller/orderController.dart';
import 'package:iccycream/screens/getStarted.dart';
import 'package:iccycream/screens/AuthPage.dart';
import 'package:get/get.dart';
import 'package:iccycream/screens/WelcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:iccycream/firebase_options.dart';
import 'package:iccycream/controller/authController.dart';
import 'package:iccycream/controller/iceCreamController.dart';
import 'package:iccycream/controller/cartController.dart';
import 'package:iccycream/screens/getStarted.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => initializingControllers());
  runApp(const MyApp());
}

void initializingControllers() {
  Get.put(AuthController());
  Get.put(IceCreamController());
  Get.put(CartController());
  Get.put(FavController());
  Get.put(OrderController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(home: StartScreen());
  }
}
