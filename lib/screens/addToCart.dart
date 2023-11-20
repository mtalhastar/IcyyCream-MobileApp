import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iccycream/controller/bottomNavController.dart';
import 'package:iccycream/controller/favController.dart';
import 'package:iccycream/models/icecream.dart';
import 'package:iccycream/controller/cartController.dart';
import 'package:iccycream/screens/WelcomePage.dart';
class AddToCartScreen extends StatelessWidget {
  NavController c = Get.find();
  AddToCartScreen({super.key, required this.item});

  final IceCream item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(width: double.infinity, color: Colors.white),
        Positioned(
            top: 0, left: 0, right: 0, child: Image.network(item.imageUrl!)),
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
                  SizedBox(
                    width: 361,
                    height: 53,
                    child: Text(
                      item.shortDescription!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: 'Jaldi',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.80,
                      ),
                    ),
                  ),
                  SizedBox(
                      width: 361,
                      height: 66,
                      child: Text(
                        '${item.price}\$',
                        style: const TextStyle(
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
                    child: SingleChildScrollView(
                      child: Text(
                        item.longDescription!,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
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
                  InkWell(
                    onTap:()=>CartController.instance.addToCart(item, 1),
                    child: Container(
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
            child: InkWell(
              onTap: ()=>{FavController.instance.addToFavCart(item)},
              child: 
              GetBuilder<FavController>(
              builder:(controller) =>
              Icon(
                Icons.favorite,
                color: FavController.instance.FindFavourite(item.id!)==true? const Color.fromARGB(255, 255, 0, 0): Color.fromARGB(255, 255, 255, 255),
                size: 40,
              ),
              )
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
              Get.off(WelcomeScreen(),transition: Transition.fade);
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
