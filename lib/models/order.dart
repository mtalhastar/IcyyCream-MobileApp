import 'package:iccycream/models/cart.dart';
import 'package:iccycream/models/icecream.dart';

class Orders {
  Orders(
      {required this.userId,
      required this.orderId,
      required this.postalCode,
      required this.phone,
      required this.city,
      required this.homeaddress,
      required this.shoppingCart,
      required this.status,
      required this.price});
      
  String userId;
  List<CartIceCream> shoppingCart;
  String homeaddress;
  String city;
  String postalCode;
  String phone;
  String orderId;
  String status;
  String price;
}
