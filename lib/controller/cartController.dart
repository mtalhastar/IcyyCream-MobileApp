import 'package:get/get.dart';
import 'package:iccycream/models/cart.dart';
import 'package:iccycream/models/icecream.dart';

class CartController extends GetxController {
  
  static CartController instance = Get.find();
  List<CartIceCream> shoppingcart = [];

  void addToCart(IceCream item, double quantity) {
    if (!shoppingcart.contains(item)) {
      shoppingcart.add(CartIceCream(iceCream: item, quantity: quantity));
    }
  }

  void changeQuantity(String itemId, double quantity) {
    for (int i = 0; i < shoppingcart.length; i++) {
      if (shoppingcart[i].iceCream.id == itemId) {
        shoppingcart[i].setQuantity(quantity);
      }
    }
  }

}
