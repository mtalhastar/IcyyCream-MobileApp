import 'package:flutter/material.dart';
import 'package:iccycream/screens/AuthPage.dart';
import 'package:get/get.dart';
import 'package:iccycream/screens/WelcomePage.dart';
import 'package:page_transition/page_transition.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/icecreampng.png',
              width: 508,
              height: 483,
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              width: 200,
              height: 115,
              child: Column(children: [
                Text(
                  'IccyCream',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                    'Taste you are looking for',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(
                    width: 5,
                  )
                ]),
              ]),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () => Get.off(const WelcomeScreen(),
                  transition: Transition.fade),
              child: Container(
                width: 250,
                height: 50,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: const Color(0xFFF8E588)),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
