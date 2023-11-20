import 'package:flutter/material.dart';
import 'package:iccycream/models/icecream.dart';
import 'package:iccycream/widgets/bottomnavbar.dart';
import 'package:get/get.dart';
import 'package:iccycream/controller/bottomNavController.dart';
import 'package:iccycream/screens/addToCart.dart';
import 'package:iccycream/controller/favController.dart';
import 'package:iccycream/controller/authController.dart';
import 'package:iccycream/screens/WelcomePage.dart';

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
                Get.off(const WelcomeScreen(), transition: Transition.fade);
                c.index.value = 1;
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined,
                  color: Colors.black))),
      body: Container(
          width: double.infinity,
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
              itemCount: FavController.instance.shoppingcart.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(
                      FavController.instance.shoppingcart[index].iceCream.id!),
                  onDismissed: (direction) => FavController.instance
                      .removeFromFav(FavController
                          .instance.shoppingcart[index].iceCream.id!),
                  child: Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        Get.to(
                            AddToCartScreen(
                              item: FavController
                                  .instance.shoppingcart[index].iceCream,
                            ),
                            transition: Transition.downToUp,
                            duration: const Duration(seconds: 1));
                      },
                      child: Row(
                        children: [
                          Image.network(
                            FavController.instance.shoppingcart[index].iceCream
                                .imageUrl!,
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
                                  child: Text(
                                    FavController.instance.shoppingcart[index]
                                        .iceCream.name!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontFamily: 'Jaldi',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.40,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.maxFinite,
                                  child: Text(
                                    FavController.instance.shoppingcart[index]
                                        .iceCream.shortDescription!,
                                    style: const TextStyle(
                                      color: Color(0xFF838383),
                                      fontSize: 18,
                                      fontFamily: 'Jaldi',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.36,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.maxFinite,
                                  child: Text(
                                    '${FavController.instance.shoppingcart[index].iceCream.price!}\$',
                                    style: const TextStyle(
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
                  ),
                );
              })),
      bottomNavigationBar: BottomNavi(),
    );
  }
}
