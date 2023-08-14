import 'package:iccycream/models/icecream.dart';

class CartIceCream {
  CartIceCream({required this.iceCream, required this.quantity});
  final IceCream iceCream;
  int quantity;

  void setQuantity(int quantity) {
    this.quantity = quantity;
  }

  void decreaseQuantity() {
    if (quantity > 0) {
      this.quantity--;
    }
  }
   void increaseQuantity() {
      this.quantity++;
  }
}
