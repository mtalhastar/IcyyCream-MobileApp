import 'package:iccycream/models/icecream.dart';

class Favourite {
  Favourite({required this.iceCream, this.flag=false});
  final IceCream iceCream;
  bool flag;
}
