import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iccycream/models/icecream.dart';
import 'package:iccycream/models/icecream.dart';
import 'package:iccycream/models/cart.dart';

class IceCreamController extends GetxController {
  static IceCreamController instance = Get.find();
  RxList<IceCream> iceCreamsList = RxList<IceCream>([]);
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  List<IceCream> filteredIceCreams = [];

  @override
  void onInit() {
    collectionReference = firestore.collection('icecreams');
    iceCreamsList.bindStream(GetIceList());
    filteredIceCreams = iceCreamsList;
    super.onInit();
  }

  Stream<List<IceCream>> GetIceList() {
    Stream<QuerySnapshot> stream = collectionReference.snapshots();
    return stream.map((qShot) => qShot.docs
        .map((doc) => IceCream(
            id: doc.id,
            name: doc['name'],
            longDescription: doc['longDescription'],
            shortDescription: doc['description'],
            price: doc['price'],
            imageUrl: doc['imageUrl'],
            category: doc['category']))
        .toList());
  }

  List<String> GetIceCreamCategories() {
    final list =
        iceCreamsList.map((element) => element.category.toString()).toList();
    print(list);
    return list;
  }

  void filteringCategories(String key) {
    if (key == 'all tastes') {
      filteredIceCreams = iceCreamsList;
      update();
      print(filteredIceCreams.length);
    } else {
      filteredIceCreams =
          iceCreamsList.where((element) => element.category == key).toList();
      update();
      print(filteredIceCreams.length);
    }
  }

  void SearchingIceCreams(String searchkey) {
    filteredIceCreams = iceCreamsList.where((element) => element.name.toLowerCase().contains(searchkey.toLowerCase())).toList();
    update();
    print(filteredIceCreams.length);
  }
  void addIceCream(String uid, String name, String description, String price,
      String imageUrl, String longDescription, String catergory) async {
    try {
      CollectionReference iceCreamCollection =
          firestore.collection('icecreams');
      await iceCreamCollection.add({
        'uid': uid,
        'name': name,
        'description': description,
        'longDescription': longDescription,
        'imageUrl': imageUrl,
        'price': price,
        'category': catergory
      });
    } catch (error) {
      print('Error adding user to Firestore: $error');
    }
  }
}
