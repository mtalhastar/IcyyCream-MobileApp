import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iccycream/controller/iceCreamController.dart';
import 'package:iccycream/widgets/card.dart';
import 'package:iccycream/widgets/categories.dart';
import 'package:iccycream/widgets/bottomnavbar.dart';
import 'package:get/get.dart';
import 'package:iccycream/controller/bottomNavController.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iccycream/controller/authController.dart';
import 'package:iccycream/models/user.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, this.user});
  final Users? user;
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(NavController());
    return Scaffold(
        body: SizedBox(
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
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  widget.user != null
                                      ? widget.user!.username
                                          .toString()
                                          .split(" ")
                                          .first
                                      : 'Loading...',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.jaldi(
                                    textStyle: const TextStyle(
                                        fontSize: 25.0,
                                        fontFamily: 'Jaldi',
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 2),
                                  ),
                                ),
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
                    Positioned(
                      right: 10,
                      top: 40,
                      child: InkWell(
                          onTap: () {
                            AuthController.instance.signOut();
                            AuthController.instance.signOutWithGoogle();
                          },
                          child: const Icon(
                            Icons.exit_to_app,
                            color: Color.fromARGB(255, 0, 0, 0),
                          )),
                    ),
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
                  child:  Row(
                    children: [
                     const  SizedBox(
                        width: 20,
                      ),
                     const  Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 138, 138, 138),
                      ),
                    const   SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Search product here',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 138, 138, 138),
                            ),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) => IceCreamController.instance.SearchingIceCreams(value) ,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: const CategoryList()),
                const SizedBox(
                  height: 25,
                ),
                GetBuilder<IceCreamController>(
                  
                  builder: (context) {
                  return Container(
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
                      itemCount: IceCreamController.instance.filteredIceCreams
                          .length, // Replace this with the actual number of grid items you want
                      itemBuilder: (context, index) {
                        return CardWidget(
                          name: IceCreamController
                              .instance.filteredIceCreams[index].name,
                          description: IceCreamController.instance
                              .filteredIceCreams[index].shortDescription,
                          longDescription: IceCreamController.instance
                              .filteredIceCreams[index].longDescription,
                          price: IceCreamController
                              .instance.filteredIceCreams[index].price,
                          imageUrl: IceCreamController
                              .instance.filteredIceCreams[index].imageUrl,
                        );
                      },
                    ),
                  );
                })
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavi());
  }
}
