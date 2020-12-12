import 'package:flutter/material.dart';

import 'package:food_delivery_app/constants.dart';

class ResturantCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String minRate;
  final String deleveryFee;

  ResturantCard(
      {this.deleveryFee, this.image, this.minRate, this.subtitle, this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 200,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        image,
                      ),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: kResturantTitleStyle),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.green,
                    ),
                    Text("4.0 (24)")
                  ],
                )
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Text(subtitle),
            SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Text("Sr $minRate minimum ", style: kLastResturantTextStyle),
                Text(
                  ": SR $deleveryFee Delivery fee",
                  style: kLastResturantTextStyle,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
