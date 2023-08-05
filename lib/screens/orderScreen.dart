import 'package:flutter/material.dart';
import 'package:iccycream/widgets/bottomnavbar.dart';
import 'package:get/get.dart';
import 'package:iccycream/controller/bottomNavController.dart';
import 'package:iccycream/screens/addToCart.dart';
import 'package:iccycream/widgets/orderCard.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  NavController c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text(
            'Orders',
            style: TextStyle(fontSize: 24),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Get.back();
                c.index.value = 1;
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined))),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child:  SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Column(
              children: [
                SizedBox(height: 10,),
                OrderCard(),
                 SizedBox(
                  height: 10,
                ),
                OrderCard(),
                 SizedBox(
                  height: 10,
                ),
                OrderCard(),
                 SizedBox(
                  height: 10,
                ),
                OrderCard(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavi(),
    );
  }
}
