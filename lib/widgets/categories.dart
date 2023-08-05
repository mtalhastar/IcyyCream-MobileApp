import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
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
                color:index==1? Colors.black:Colors.white,
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
            onTap: () => 
            setState(() {
              index=1;
            })
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            child: Container(
              alignment: Alignment.center,
              width: 101,
              height: 30,
              decoration: ShapeDecoration(
                color: index == 2 ? Colors.black : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child:  Text(
                'strawberry',
                style: TextStyle(
                  color: index == 2 ? Colors.white : Colors.black,
                  fontSize: 14,
                  fontFamily: 'Jaldi',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.70,
                ),
              ),
                  
            ),
                 onTap: () => setState(() {
                    index = 2;
                  })
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            child: Container(
              alignment: Alignment.center,
              width: 101,
              height: 30,
              decoration: ShapeDecoration(
                color:index == 3 ? Colors.black : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child:  Text(
                'banana',
                style: TextStyle(
                  color: index == 3 ? Colors.white : Colors.black,
                  fontSize: 14,
                  fontFamily: 'Jaldi',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.70,
                ),
              ),
            ),
                 onTap: () => setState(() {
                    index = 3;
                  })
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            child: Container(
              alignment: Alignment.center,
              width: 101,
              height: 30,
              decoration: ShapeDecoration(
                color: index == 4 ? Colors.black : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'vanilla',
                style: TextStyle(
                  color:index == 4 ? Colors.white: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Jaldi',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.70,
                ),
              ),
            ),
                 onTap: () => setState(() {
                    index = 4;
                  })
          ),
        ],
      ),
    );
  }
}
