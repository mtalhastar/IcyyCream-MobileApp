import 'package:get/get.dart';
import 'package:iccycream/models/cart.dart';
import 'package:iccycream/models/favourites.dart';
import 'package:iccycream/models/icecream.dart';

class FavController extends GetxController {
  static FavController instance = Get.find();
  List<Favourite> shoppingcart = [];

  void addToFavCart(IceCream item) {
    int index =
        shoppingcart.indexWhere((cartItem) => cartItem.iceCream.id == item.id);
    if (index != -1) {
    } else {
      shoppingcart.add(Favourite(iceCream: item, flag: true));
    }
    update();
  }

  bool FindFavourite(String id) {
    int index = shoppingcart.indexWhere(
        (element) => element.flag == true && element.iceCream.id == id);
    if (index > -1) {
      return true;
    }
    update();
    return false;
  }

  void removeFromFav(String id) {
    for (int i = 0; i < shoppingcart.length; i++) {
      if (shoppingcart[i].iceCream.id == id) {
        shoppingcart[i].flag = false;
        shoppingcart.remove(shoppingcart[i]);
      }
    }
    update();
  }
}
