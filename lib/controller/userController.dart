import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserController extends GetxController {
 
  static UserController instance = Get.find();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addUserToCollection(String uid, String username, String email) async {
    try {
      CollectionReference usersCollection = firestore.collection('users');
      await usersCollection.doc('uid').set({
        'uid': uid,
        'username': username,
        'email': email,
      });

      print('User added to Firestore successfully');
    } catch (error) {
      print('Error adding user to Firestore: $error');
    }
  }
  void removeUserByUid(String uidToRemove) async {
    try {
      CollectionReference usersCollection = firestore.collection('users');
      QuerySnapshot snapshot = await usersCollection.where('uid', isEqualTo: uidToRemove).get();
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        await doc.reference.delete();
      }
      print('User(s) with UID $uidToRemove removed from Firestore');
    } catch (error) {
      print('Error removing user(s) from Firestore: $error');
    }
  }

}
