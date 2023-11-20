import 'package:flutter/material.dart';
import 'package:iccycream/widgets/bottomnavbar.dart';
import 'package:get/get.dart';
import 'package:iccycream/controller/bottomNavController.dart';
import 'package:iccycream/widgets/orderCard.dart';
import 'package:iccycream/controller/orderController.dart';
import 'package:iccycream/screens/WelcomePage.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  NavController c = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ordersList = OrderController.instance.GetOrdersByUid();
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text(
            'Orders',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                c.index.value = 1;
                Get.off(const WelcomeScreen(),transition: Transition.fade);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              ))),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ListView.builder(
                itemCount: ordersList.length,
                itemBuilder: (context, index) => OrderCard(
                    orderId: ordersList[index].orderId,
                    postalCode: ordersList[index].postalCode,
                    status: ordersList[index].status,
                    homeaddress: ordersList[index].homeaddress,
                    price: ordersList[index].price))),
      ),
      bottomNavigationBar: BottomNavi(),
    );
  }
}
