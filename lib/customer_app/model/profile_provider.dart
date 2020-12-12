import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/customer_app/navigation_bar/navigation_bar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import '../../constants.dart';
import 'package:food_delivery_app/routes/routes_names.dart';

class ProfileProvider extends ChangeNotifier {
  bool isSave = false;
  File image;

  //Picking image

  Future pickImage() async {
    var sampleImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    image = sampleImage;
    notifyListeners();
  }

  //show Image for Upload

  Widget showImage() {
    if (image != null) {
      return ClipOval(
          child: Image.file(
        image,
        fit: BoxFit.fill,
        height: 120,
        width: 120,
      ));
    } else {
      return Center(
        child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kThemeColor, width: 5)),
            child: Image.asset(
              "images/profile.png",
              height: 120,
              width: 120,
            )),
      );
    }
  }

  void isSaveForCircularProgressIntoTrue() {
    isSave = false;
  }

  void uploadUserProfileInfo(String name, String phone, String address,
      String email, BuildContext context) async {
    // print(name);
    // print(image.toString());
    // isSave = true;
    // String url =
    //     "https://unforewarned-rolls.000webhostapp.com/trippApi/customerUsers.php";
    // http.Response response = await http.post(url,
    //     body: ({
    //       'image': 'image.toString()',
    //       'name': name,
    //       'address': address,
    //       'phone': phone,
    //       'email': email,
    //     }),
    //     headers: {'Accept': 'application/json'});
    // print(response.statusCode);
    // var jsonConvert = jsonEncode(response.body);
    Navigator.pushNamed(context, navigationBar);
    notifyListeners();
  }
}
