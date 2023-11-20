import 'package:flutter/material.dart';
import 'package:iccycream/screens/getStarted.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:iccycream/firebase_options.dart';
import 'package:iccycream/store/storeBinding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
        debugShowCheckedModeBanner: false, home: const StartScreen(),
        initialBinding:StoreBinding() );
  }
}
