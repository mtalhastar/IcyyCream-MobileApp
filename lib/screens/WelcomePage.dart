import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iccycream/widgets/card.dart';
import 'package:iccycream/widgets/categories.dart';
import 'package:iccycream/widgets/bottomnavbar.dart';
import 'package:get/get.dart';
import 'package:iccycream/controller/bottomNavController.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(NavController());
    return Scaffold(
        body: Container(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    const SizedBox(
                      height: 250,
                      width: double.maxFinite,
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 200,
                        width: double.maxFinite,
                        color: const Color(0xFFFFE982),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              width: double.maxFinite,
                              child: Row(children: [
                                Text(
                                  'Welcome ',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.jaldi(
                                    textStyle: const TextStyle(fontSize: 40.0),
                                  ),
                                ),
                                Text(
                                  'Jasmin',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.jaldi(
                                    textStyle: const TextStyle(
                                        fontSize: 40.0,
                                        fontFamily: 'Jaldi',
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2),
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                    onTap: () async {
                                      print('I am clicked');
                                     await FirebaseAuth.instance.signOut();
                                     await GoogleSignIn().signOut;
                                    
                                    
                                    },
                                    child: const Center(
                                        child: Icon(
                                      Icons.exit_to_app,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    )))
                              ]),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                width: double.maxFinite,
                                child: Text(
                                  'Find your fav \nIce-creams',
                                  style: GoogleFonts.kodchasan(
                                    textStyle: const TextStyle(fontSize: 24.0),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/images/pppn.png',
                          width: 150,
                        )),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  width: double.maxFinite,
                  height: 52,
                  decoration: ShapeDecoration(
                    color: Color.fromARGB(255, 255, 255, 255).withOpacity(1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color.fromARGB(86, 162, 162, 162),
                        blurRadius: 1,
                        offset: Offset(0, 0.2),
                        spreadRadius: 1.3,
                      )
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 138, 138, 138),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Search product here',
                        style: TextStyle(
                          color: Color.fromARGB(255, 138, 138, 138),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: const CategoryList()),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: 400,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            mainAxisExtent: 240,
                            crossAxisSpacing: 20),
                    itemCount:
                        3, // Replace this with the actual number of grid items you want
                    itemBuilder: (context, index) {
                      return const CardWidget(
                        name: 'Zombie',
                        description: 'with Vanilla',
                        price: '20',
                        imageUrl: 'assets/images/zombie2.png',
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavi());
  }
}
