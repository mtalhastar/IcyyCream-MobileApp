import 'package:get/get.dart';
import 'package:iccycream/models/cart.dart';
import 'package:iccycream/models/icecream.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  List<CartIceCream> shoppingcart = [];

  void addToCart(IceCream item, int quantity) {
    int index =
        shoppingcart.indexWhere((cartItem) => cartItem.iceCream.id == item.id);

    if (index != -1) {
      // If item already exists in the cart, update the quantity
      shoppingcart[index].quantity += quantity;
    } else {
      shoppingcart.add(CartIceCream(iceCream: item, quantity: quantity));
    }
  }

  void removeFromCart(String id) {
    for (int i = 0; i < shoppingcart.length; i++) {
      if (shoppingcart[i].iceCream.id == id) {
        shoppingcart.remove(shoppingcart[i]);
      }
    }
    update();
  }

  void changeQuantity(String itemId, int quantity) {
    for (int i = 0; i < shoppingcart.length; i++) {
      if (shoppingcart[i].iceCream.id == itemId) {
        shoppingcart[i].setQuantity(quantity);
      }
    }
  }

  void increaseQuantity(String itemId) {
    for (int i = 0; i < shoppingcart.length; i++) {
      if (shoppingcart[i].iceCream.id == itemId) {
        shoppingcart[i].increaseQuantity();
      }
    }
    update();
  }

  void decreaseQuantity(String itemId) {
    for (int i = 0; i < shoppingcart.length; i++) {
      if (shoppingcart[i].iceCream.id == itemId) {
        shoppingcart[i].decreaseQuantity();
      }
    }
    update();
  }

  double CalcuatingPrice() {
    double price = 0;
    for (int i = 0; i < shoppingcart.length; i++) {
      price = price +
          int.parse(shoppingcart[i].iceCream.price!) * shoppingcart[i].quantity;
    }
    return price;
  }
}
