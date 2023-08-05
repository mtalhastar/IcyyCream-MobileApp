import 'package:get/get.dart';

class NavController extends GetxController {
  var index = 1.obs;
  void setIndex(int values) {
    index.value = values;
  }
}
