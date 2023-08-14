import 'package:get/get.dart';
import 'package:iccycream/models/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iccycream/models/cart.dart';

class OrderController extends GetxController {
  RxList<Orders> iceCreamsList = RxList<Orders>([]);
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  static OrderController instance = Get.find();

  @override
  void onInit() {
    collectionReference = firestore.collection('orders');
    iceCreamsList.bindStream(GetIceList());
    super.onInit();
  }

  Stream<List<Orders>> GetIceList() {
    Stream<QuerySnapshot> stream = collectionReference.snapshots();
    return stream.map((qShot) => qShot.docs
        .map((doc) => Orders(
            orderId: doc.id,
            userId: doc['userId'],
            postalCode: doc['postalCode'],
            phone: doc['phone'],
            city: doc['city'],
            status: doc['status'],
            homeaddress: doc['homeaddress'],
            shoppingCart: doc['shoppingCart'],
            price: doc['price']))
        .toList());
  }

  void assignOrders(Orders item) {
    int index = iceCreamsList
        .indexWhere((cartItem) => cartItem.orderId == item.orderId);
    if (index != -1) {
    } else {
      iceCreamsList.add(item);
    }
    update();
  }

  void addOrders(
      String uid,
      String postalCode,
      String phone,
      String price,
      String city,
      String status,
      String homeaddress,
      List<CartIceCream> shoppingCart) async {
    try {
      CollectionReference ordersCollection = firestore.collection('orders');
      await ordersCollection.add({
        'userId': uid,
        'postalCode': postalCode,
        'phone': phone,
        'city': city,
        'price': price,
        'status': status,
        'shoppingCart': shoppingCart,
        'homeaddress': homeaddress
      });
    } catch (error) {
      Get.snackbar('Progress Failed', 'Please try again',
          snackPosition: SnackPosition.BOTTOM);
      print('Error adding user to Firestore: $error');
    }
  }
}
