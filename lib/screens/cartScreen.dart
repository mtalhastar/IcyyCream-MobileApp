import 'package:flutter/material.dart';
import 'package:iccycream/widgets/bottomnavbar.dart';
import 'package:get/get.dart';
import 'package:iccycream/controller/bottomNavController.dart';

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
            style: TextStyle(fontSize: 18,color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Get.back();
                c.index.value = 1;
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black))),
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
                              color: Color.fromARGB(255, 194, 194, 194),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 20,
                      color: Color.fromARGB(255, 227, 226, 226),
                      child: const Text('+')),
                     const  SizedBox(height: 5,),
                     Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 20,
                          color: Color.fromARGB(255, 224, 224, 224),
                          child: const Text('1')),
                         const  SizedBox(
                        height: 5,
                      ),
                      Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          color: Color.fromARGB(255, 228, 228, 228),
                          child: const Text('-')),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        height: 300,
        width: double.infinity,
        decoration:  BoxDecoration(
            color: Color.fromARGB(255, 249, 249, 249),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 138, 137, 137).withOpacity(0.5), // Shadow color
                spreadRadius:
                    2, // Spread radius (positive values increase the size of the shadow)
                blurRadius:
                    3, // Blur radius (the higher, the more diffuse the shadow will be)
                offset: Offset(0, 0), // Offset of the shadow (X, Y)
              ),
            ],
            borderRadius: const  BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      const SizedBox(height: 10,),
                        Text('Order Summary',style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.w600,
                        ),),
                   const  SizedBox(height: 20,),
                 const    Row(
                      children: [Text('Price') , Spacer(),Text('100\$')],
                    ),
                  const     SizedBox(
                height: 20,
              ),
                  const   Row(
                      children: [Text('Discount') , Spacer(),Text('5%')],
                    ),
                  const     SizedBox(
                height: 20,
              ),
                 const  Row(
                      children: [Text('Total Price') , Spacer(),Text('400\$')],
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
                child: const Text('Proceed',
                style: TextStyle(color: Colors.white,
                fontSize:20)),
              )
                
                    ],
                  ),
                ),
      ),
    );
  }
}
