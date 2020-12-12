import 'package:flutter/material.dart';
import 'package:food_delivery_app/common_screens/components/roles_card.dart';
import 'package:food_delivery_app/customer_app/views/profile/create_profile.dart';
import 'package:food_delivery_app/resturant_app/views/signup/general_informations.dart';
import 'package:food_delivery_app/routes/routes_names.dart';

class SignRole extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  "Please Select A Role",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  RoleCard(
                    title: "I'm Customer",
                    image: "images/user.png",
                    onTap: () {
                      Navigator.pushNamed(context, createProfile);
                    },
                  ),
                  RoleCard(
                    title: "As a Resturant",
                    image: "images/resturentIcon.png",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GeneralInformations(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              RoleCard(
                title: "I'm Delivery-Boy",
                image: "images/deliveryBoy.png",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
