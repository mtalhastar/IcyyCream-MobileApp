import 'package:flutter/material.dart';
import 'package:iccycream/controller/cartController.dart';
import 'package:iccycream/widgets/bottomnavbar.dart';
import 'package:get/get.dart';
import 'package:iccycream/controller/bottomNavController.dart';
import 'package:iccycream/widgets/cartItem.dart';
import 'package:iccycream/screens/checkout.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  NavController c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text(
            'Cart',
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
          height: 400,
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<CartController>(builder: (context) {
            return ListView.builder(
              itemCount: CartController.instance.shoppingcart.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(CartController
                      .instance.shoppingcart[index].iceCream.id
                      .toString()),
                  onDismissed: (direction) {
                    CartController.instance.removeFromCart(CartController
                        .instance.shoppingcart[index].iceCream.id
                        .toString());
                  },
                  child: Card(
                    elevation: 0.4,
                    child: CardItem(
                        item: CartController.instance.shoppingcart[index]),
                  ),
                );
              },
            );
          })),
      bottomSheet: Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 249, 249, 249),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 138, 137, 137)
                    .withOpacity(0.5), // Shadow color
                spreadRadius:
                    2, // Spread radius (positive values increase the size of the shadow)
                blurRadius:
                    3, // Blur radius (the higher, the more diffuse the shadow will be)
                offset: Offset(0, 0), // Offset of the shadow (X, Y)
              ),
            ],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(5),
          child: GetBuilder<CartController>(builder: (context) {
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Order Summary',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text('Price'),
                    const Spacer(),
                    Text('${CartController.instance.CalcuatingPrice()}\$')
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [Text('Discount'), Spacer(), Text('5%')],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text('Total Price'),
                    const Spacer(),
                    Text('${CartController.instance.CalcuatingPrice()}\$')
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.maxFinite,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.to(const CheckoutScreen());
                    },
                    child: const Text('Proceed',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
