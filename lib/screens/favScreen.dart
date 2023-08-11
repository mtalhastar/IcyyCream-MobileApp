import 'package:flutter/material.dart';
import 'package:iccycream/widgets/bottomnavbar.dart';
import 'package:get/get.dart';
import 'package:iccycream/controller/bottomNavController.dart';
import 'package:iccycream/screens/addToCart.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  NavController c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text(
            'Favourite',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Get.back();
                c.index.value = 1;
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined,
                  color: Colors.black))),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              child: InkWell(
                onTap: () {
                  Get.to(
                      AddToCartScreen(
                        imageUrl: 'assets/images/zombie2.png',
                        price: '',
                        longDescription: '',
                        shortDescription: '',
                      ),
                      transition: Transition.downToUp,
                      duration: const Duration(seconds: 1));
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/zombie2.png',
                      height: 100,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: double.maxFinite,
                            child: const Text(
                              'IceCream - Zombie',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Jaldi',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.40,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: double.maxFinite,
                            child: Text(
                              'Vanilla-Strawberry',
                              style: TextStyle(
                                color: Color(0xFF838383),
                                fontSize: 18,
                                fontFamily: 'Jaldi',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.36,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: double.maxFinite,
                            child: Text(
                              '20\$',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Jaldi',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.40,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavi(),
    );
  }
}
