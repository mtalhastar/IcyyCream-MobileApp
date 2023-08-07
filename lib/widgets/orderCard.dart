import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 253, 253, 253),
        borderRadius: BorderRadius.all(Radius.circular(10)), // Rounded corners

        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 126, 126, 126),
            // Shadow color
            blurRadius: 1,
            offset: Offset(0, 0), // Shadow offset
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'IceCream-Zombie',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Vanilla - Strawberry',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '20\$ x 2',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'House Address:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text('727-F Block, K Society , Karachi'),
            SizedBox(
              height: 5,
            ),
            Text('Sub-Total: 400\$',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text('To Be Delivered',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.yellow)),
                Spacer(),
                Text(
                  'abfd141412fdfdf',
                  style: TextStyle(color: Colors.red),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
