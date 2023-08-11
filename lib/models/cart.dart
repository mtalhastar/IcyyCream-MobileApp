import 'package:iccycream/models/icecream.dart';

class CartIceCream {

  CartIceCream({required this.iceCream, required this.quantity});
  final IceCream iceCream;
  double quantity;

  void setQuantity(double quantity) {
    this.quantity = quantity;
  }

}
