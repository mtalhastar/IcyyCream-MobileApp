import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:iccycream/screens/addToCart.dart';
import 'package:iccycream/models/icecream.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key, required this.icecream});
  final IceCream icecream;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ignore: prefer_const_constructors
        Column(children: const [
          SizedBox(
            height: 240,
            width: 165,
          ),
        ]),
        Positioned(
            left: 5,
            right: 5,
            top: 5,
            child: InkWell(
              onTap: () {
                Get.off(
                    AddToCartScreen(
                      item: widget.icecream,
                    ),
                    transition: Transition.downToUp,
                    duration: const Duration(seconds: 1));
              },
                child: Image.network(widget.icecream.imageUrl!,
                height: 100,
                width: 132, 
                loadingBuilder: (BuildContext context,
                      Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              }),
            )),
        Positioned(
          left: 5,
          right: 5,
          bottom: 70,
          child: Text(
            widget.icecream.name!,
            textAlign: TextAlign.left,
            style: GoogleFonts.jaldi(
              textStyle: const TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Jaldi',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2),
            ),
          ),
        ),
        Positioned(
          left: 5,
          right: 5,
          bottom: 50,
          child: Text(
            widget.icecream.shortDescription!,
            textAlign: TextAlign.left,
            style: GoogleFonts.jaldi(
              textStyle: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Positioned(
          left: 5,
          right: 5,
          bottom: 0,
          child: Text(
            '\$${widget.icecream.price}',
            textAlign: TextAlign.left,
            style: GoogleFonts.jaldi(
              textStyle: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2),
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          right: 8,
          child: Container(
            alignment: Alignment.center,
            width: 33,
            height: 33,
            decoration: const ShapeDecoration(
              color: Colors.black,
              shape: OvalBorder(),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
