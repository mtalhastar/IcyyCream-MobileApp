import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iccycream/controller/iceCreamController.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<String> newicecreamlist = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newicecreamlist = IceCreamController.instance.GetIceCreamCategories();
  }

  int index = 1;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            width: 10,
          ),
          InkWell(
              child: Container(
                alignment: Alignment.center,
                width: 101,
                height: 30,
                decoration: ShapeDecoration(
                  color: index == 1 ? Colors.black : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'all tastes',
                  style: TextStyle(
                    color: index == 1 ? Colors.white : Colors.black,
                    fontSize: 14,
                    fontFamily: 'Jaldi',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.70,
                  ),
                ),
              ),
              onTap: () => setState(() {
                    IceCreamController.instance
                        .filteringCategories('all tastes');

                    index = 1;
                  })),
          const SizedBox(
            width: 10,
          ),
          for (var i = 0; i < newicecreamlist.length; i++)
            Row(
              children: [
                InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      width: 101,
                      height: 30,
                      decoration: ShapeDecoration(
                        color: index == 2 + i ? Colors.black : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        newicecreamlist[i],
                        style: TextStyle(
                          color: index == 2 + i ? Colors.white : Colors.black,
                          fontSize: 14,
                          fontFamily: 'Jaldi',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.70,
                        ),
                      ),
                    ),
                    onTap: () => setState(() {
                          IceCreamController.instance
                              .filteringCategories(newicecreamlist[i]);
                          
                          index = 2 + i;
                        })),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
