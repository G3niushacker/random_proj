import 'package:flutter/material.dart';
import 'package:food_delivery_app/common_clip_paths/signup_uper_clip.dart';
import 'package:food_delivery_app/constants.dart';

class DeliveryBoyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("Hammad"),
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: UpperContainerClipper(),
            child: Container(
              height: 200,
              color: kThemeColor,
              child: Center(
                child: Text(
                  "Hammad",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
