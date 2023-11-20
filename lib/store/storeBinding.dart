import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iccycream/controller/favController.dart';
import 'package:iccycream/controller/orderController.dart';
import 'package:iccycream/controller/authController.dart';
import 'package:iccycream/controller/iceCreamController.dart';
import 'package:iccycream/controller/cartController.dart';
import 'package:iccycream/controller/bottomNavController.dart';
import 'package:iccycream/controller/categories.dart';

class StoreBinding implements Bindings {
// default dependency
 @override
 void dependencies() {
    Get.put(AuthController());
    Get.put(NavController());
    Get.put(CategoriesController());
    Get.put(IceCreamController());
    Get.put( CartController());
    Get.put( FavController());
    Get.put(OrderController());
 }
}