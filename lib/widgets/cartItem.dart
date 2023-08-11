import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iccycream/controller/cartController.dart';
import 'package:iccycream/models/icecream.dart';
import 'package:iccycream/models/cart.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.item});
  final CartIceCream item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Image.network(
            item.iceCream.imageUrl!,
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
                  child:  Text(
                    item.iceCream.name!,
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
                  child: Text(item.iceCream.shortDescription!,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 194, 194, 194),
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
                    '${item.iceCream.price!}\$',
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => CartController.instance.increaseQuantity(item.iceCream.id!),
                child: Container(
                    alignment: Alignment.center,
                    height: 20,
                    width: 20,
                    color: const Color.fromARGB(255, 227, 226, 226),
                    child: const Text('+')),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 20,
                  color: const Color.fromARGB(255, 224, 224, 224),
                  child:  Text('${item.quantity}')),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                  onTap: () => CartController.instance.decreaseQuantity(item.iceCream.id!),
                child: Container(
                    alignment: Alignment.center,
                    height: 20,
                    width: 20,
                    color: const Color.fromARGB(255, 228, 228, 228),
                    child: const Text('-')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
