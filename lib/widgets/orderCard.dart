import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  OrderCard(
      {super.key,
      required this.orderId,
      required this.postalCode,
      required this.status,
      required this.homeaddress,
      required this.price});
  String orderId;
  String postalCode;
  String status;
  String homeaddress;
  String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 44, 44, 44),
        borderRadius: BorderRadius.all(Radius.circular(10)), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 255, 254, 254),
            // Shadow color
            blurRadius: 5,
            offset: Offset(0, 0), // Shadow offset
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              orderId,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.white),
            ),
         const SizedBox(
              height: 5,
            ),
            Text(
              '${price}\$',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
           const SizedBox(
              height: 5,
            ),
            Text(
            homeaddress,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          const  SizedBox(
              height: 5,
            ),
                Text(status,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.yellow,
                   )),
          ],
        ),
      ),
    );
  }
}
