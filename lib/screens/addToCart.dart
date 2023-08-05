import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iccycream/controller/bottomNavController.dart';

class AddToCartScreen extends StatelessWidget {
  NavController c = Get.find();
  AddToCartScreen({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(width: double.infinity, color: Colors.white),
        Positioned(top: 0, left: 0, right: 0, child: Image.asset(imageUrl)),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 500,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40))),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 60),
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const SizedBox(
                    width: 361,
                    height: 66,
                    child: Text(
                      'IceCream - Zombie',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: 'Jaldi',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.80,
                      ),
                    ),
                  ),
                  const SizedBox(
                      width: 361,
                      height: 66,
                      child: Text(
                        '20\$',
                        style: TextStyle(
                          color: Color(0xFFEEC605),
                          fontSize: 40,
                          fontFamily: 'Jaldi',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2.40,
                        ),
                      )),
                  Container(
                    width: double.maxFinite,
                    height: 150,
                    child: const SingleChildScrollView(
                      child: Text(
                        'At first glance, the appearance is deceivingly innocuous—a scoop of ice cream, seemingly like any other, nestled in a frosty, pitch-black waffle cone.'
                        'But beware for it'
                        's not just any frozen treat that beckons to you its a sinister concoction that defies the boundaries of the culinary realm.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Jaldi',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.36,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 378,
                    height: 60,
                    decoration: ShapeDecoration(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          bottom: 470,
          child: Container(
            width: 65,
            height: 65,
            alignment: Alignment.center,
            decoration: const ShapeDecoration(
              color: Color(0xFFFFE982),
              shape: OvalBorder(
                side: BorderSide(width: 0.50, color: Color(0x63585858)),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: const Icon(
              Icons.favorite,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: 20,
          child: InkWell(
            onTap: () {
              c.setIndex(1);
              print(c.index.value);
              Get.back();
            },
            child: Container(
              width: 44,
              height: 43,
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.4),
                shape: const OvalBorder(),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3FCCCCCC),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 3,
                  )
                ],
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
