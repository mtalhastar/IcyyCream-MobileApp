import 'package:flutter/material.dart';
import 'package:iccycream/screens/WelcomePage.dart';
import 'package:iccycream/screens/addToCart.dart';
import 'package:iccycream/screens/favScreen.dart';
import 'package:get/get.dart';
import 'package:iccycream/screens/cartScreen.dart';
import 'package:iccycream/controller/bottomNavController.dart';
import 'package:iccycream/screens/orderScreen.dart';

class BottomNavi extends StatelessWidget {
  final NavController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      width: double.infinity,
      height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        color: Colors.black,
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
                onTap: () {
                  if (controller.index.value != 1) {
                    Get.back();
                  }
                  controller.setIndex((1));
                },
                child: Obx(
                  () => Icon(
                    Icons.person,
                    color: controller.index.value == 1
                        ? Color.fromARGB(255, 255, 238, 85)
                        : Colors.white,
                    size: 30,
                  ),
                )),
          ),
          Expanded(
              child: InkWell(
                  onTap: () {
                    controller.setIndex((2));
                    Get.off(const CartScreen());
                  },
                  child: Obx(
                    () => Icon(
                      Icons.shopping_cart,
                      color: controller.index.value == 2
                          ? Color.fromARGB(255, 255, 238, 85)
                          : Colors.white,
                      size: 26,
                    ),
                  ))),
          Expanded(
              child: InkWell(
                  onTap: () {
                    controller.setIndex((3));
                    Get.off(FavScreen(),
                        transition: Transition.fadeIn,
                        duration: const Duration(milliseconds: 700));
                  },
                  child: Obx(
                    () => Icon(
                      Icons.favorite,
                      color: controller.index.value == 3
                          ? Color.fromARGB(255, 255, 238, 85)
                          : Colors.white,
                      size: 26,
                    ),
                  ))),
          Expanded(
            child: InkWell(
                onTap: () {
                  controller.setIndex((4));
                  Get.off(OrderScreen());
                },
                child: Obx(
                  () => Icon(
                    Icons.delivery_dining,
                    color: controller.index.value == 4
                        ? Color.fromARGB(255, 255, 238, 85)
                        : Colors.white,
                    size: 30,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
