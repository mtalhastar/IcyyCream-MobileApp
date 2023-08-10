import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iccycream/models/icecream.dart';
import 'package:iccycream/models/icecream.dart';

class CategoriesController extends GetxController {
  static CategoriesController instance = Get.find();
  RxList<String> iceCreamsList = RxList<String>([]);
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  @override
  void onReady() {
    collectionReference = firestore.collection('categories');
    iceCreamsList.bindStream(GetCategories());
    super.onReady();
  }

  Stream<List<String>> GetCategories() {
    Stream<QuerySnapshot> stream = collectionReference.snapshots();
    return stream.map((qShot) => qShot.docs
        .map((doc) =>  doc['name'].toString(),
         )
        .toList());
  }
}
