import 'package:flutter/material.dart';
import 'package:iccycream/widgets/bottomnavbar.dart';
import 'package:get/get.dart';
import 'package:iccycream/controller/bottomNavController.dart';
import 'package:iccycream/controller/orderController.dart';
import 'package:iccycream/controller/cartController.dart';
import 'package:iccycream/controller/authController.dart';
import 'package:iccycream/screens/WelcomePage.dart';
class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  TextEditingController shippingAddress = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController postalAddress = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    shippingAddress.dispose();
    phone.dispose();
    city.dispose();
    postalAddress.dispose();
  }

  void makeOrder() {
    if (shippingAddress.value.text.trim().isEmpty) {
      Get.snackbar('Invalid Input', 'Shipping address is empty',
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (phone.value.text.trim().isEmpty) {
      Get.snackbar('Invalid Input', 'Phone is empty',
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (city.value.text.trim().isEmpty) {
      Get.snackbar('Invalid Input', 'City is empty',
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (postalAddress.value.text.trim().isEmpty) {
      Get.snackbar('Invalid Input', 'Postal Address is empty',
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    final shoppingList = CartController.instance.shoppingcart;

    if (shoppingList.length == 0) {
      Get.snackbar('Cart Is Empty', 'Add some things to cart to proceed',
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM);
    }

    final price = CartController.instance.CalcuatingPrice();
    final authenticationUid = AuthController.instance.users.uid;

    OrderController.instance.addOrders(
      authenticationUid.toString(),
      postalAddress.value.text,
      phone.value.text,
      price.toString(),
      city.value.text,
      'In-Progress',
      shippingAddress.value.text,
    );
    shippingAddress.clear();
    phone.clear();
    city.clear();
    postalAddress.clear();

    Get.off(context, transition: Transition.downToUp);
  }

  NavController c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text(
            'Checkout',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
              onPressed: () {
                Get.off(WelcomeScreen(), transition: Transition.fade);
                c.index.value = 1;
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined,
                  color: Colors.black))),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
            width: double.infinity,
            height: 1000,
            color: const Color.fromARGB(255, 255, 255, 255),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            const Offset(0, 0), // changes the shadow position
                      ),
                    ],
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextFormField(
                    controller: shippingAddress,
                    decoration: const InputDecoration(
                      hintText: 'Enter Shipping Address',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 138, 138, 138),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 0), // changes the shadow position
                      ),
                    ],
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextFormField(
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: 'Enter Phone Number',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 138, 138, 138),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 0), // changes the shadow position
                      ),
                    ],
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextFormField(
                    controller: city,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: 'Enter City',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 138, 138, 138),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            const Offset(0, 0), // changes the shadow position
                      ),
                    ],
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextFormField(
                    controller: postalAddress,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Enter Postal Code',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 138, 138, 138),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                InkWell(
                  onTap: () {
                    makeOrder();
                    Get.off(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.maxFinite,
                    height: 59,
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 1,
                          offset: Offset(0, 0),
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: const Text(
                      'Cash on Delivery',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'OR',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.maxFinite,
                  height: 58,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 0.50,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFC9C9C9),
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 1,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/nice.png',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Stripe',
                          style: TextStyle(
                            color: Color(0xFF6772E4),
                            fontSize: 24,
                            fontFamily: 'Jaldi',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.20,
                          ),
                        ),
                      ]),
                )
              ],
            )),
      ),
      bottomNavigationBar: BottomNavi(),
    );
  }
}
