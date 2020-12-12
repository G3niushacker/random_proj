import 'dart:io';
import 'dart:math';
import 'package:food_delivery_app/resturant_app/views/signup/components/general_detail_card.dart';
import 'package:food_delivery_app/resturant_app/views/signup/components/general_information_card_contnet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/resturant_app/views/signup/personal_information.dart';
import 'package:image_picker/image_picker.dart';

class GeneralInformations extends StatefulWidget {
  @override
  _GeneralInformationsState createState() => _GeneralInformationsState();
}

class _GeneralInformationsState extends State<GeneralInformations> {
  FirebaseAuth auth = FirebaseAuth.instance;

  var userr;

  checkUser() async {
    final user = auth.currentUser;
    if (user != null) {
      setState(() {
        userr = user.uid;
        print("new user is here $userr");
      });
    }
  }

  String name;

  String address;

  File selfieImage;
  File resturantImage;
  File cnicFront;
  File cnicBack;

  bool isSave = false;

  final firestore = FirebaseFirestore.instance;

  Future pickSelfieImage() async {
    var sampleImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      selfieImage = sampleImage;
      print("path is ${selfieImage.path}");
      print("uri is ${selfieImage.uri}");
    });
  }

  Widget showSelfieImage() {
    if (selfieImage != null) {
      return Image.file(
        selfieImage,
        fit: BoxFit.fill,
        // height: 120,
        // width: 120,
      );
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

  Future pickResturantImage() async {
    var sampleImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      resturantImage = sampleImage;
    });
  }

  Widget showResturantImage() {
    if (resturantImage != null) {
      return Image.file(
        resturantImage,
        fit: BoxFit.fill,
        height: 120,
        width: 120,
      );
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

  Future pickCnicFonrtImage() async {
    var sampleImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      cnicFront = sampleImage;
    });
  }

  Widget showCnicFonrtImage() {
    if (cnicFront != null) {
      return Image.file(
        cnicFront,
        fit: BoxFit.fill,
        height: 120,
        width: 120,
      );
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

  Future pickCnicBackImage() async {
    var sampleImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      cnicBack = sampleImage;
    });
  }

  Widget showCnicBackImage() {
    if (cnicBack != null) {
      return Image.file(
        cnicBack,
        fit: BoxFit.fill,
        height: 120,
        width: 120,
      );
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

  // uploadImageAndUserInfo() async {
  //   int num = 555555;
  //   var random = Random().nextInt(num);
  //   try {
  //     StorageTaskSnapshot storageReference = await FirebaseStorage.instance
  //         .ref()
  //         .child('customers/users/userNumber$random.jpg')
  //         .putFile(selfieImage)
  //         .onComplete;
  // final String downloadURL = await storageReference.ref.getDownloadURL();
  // if (storageReference.error == null) {
  //   await firestore
  //       .collection('customers')
  //       .document('users')
  //       .collection('Profiles')
  //       .document('$userr')
  //       .setData({
  //     'name': name,
  //     'email': widget.emailController,
  //     'address': address,
  //     'phone': _phoneNumber,
  //     'image': downloadURL
  //   }).then((value) {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (ctx) => NavigationBar()));
  //   });
  // }
  //   } catch (e) {
  //     print(e.message);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Submit Your Documents",
                style: kTopLebelStyle,
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Cards(
                        ontap: () {
                          pickSelfieImage();
                        },
                        colour: kThemeColor,
                        cardChild: selfieImage == null
                            ? IconContent(
                                icon: Icons.camera_alt,
                                gender: "Your Selfie",
                              )
                            : showSelfieImage(),
                      ),
                    ),
                    Expanded(
                      child: Cards(
                        ontap: () {
                          pickResturantImage();
                        },
                        colour: kThemeColor,
                        cardChild: resturantImage == null
                            ? IconContent(
                                icon: Icons.camera_alt,
                                gender: "Resturant Selfie",
                              )
                            : showResturantImage(),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Cards(
                        ontap: () {
                          pickCnicFonrtImage();
                        },
                        colour: kThemeColor,
                        cardChild: cnicFront == null
                            ? IconContent(
                                icon: Icons.camera_alt,
                                gender: "CNIC Front",
                              )
                            : showCnicFonrtImage(),
                      ),
                    ),
                    Expanded(
                      child: Cards(
                        ontap: () {
                          pickCnicBackImage();
                        },
                        colour: kThemeColor,
                        cardChild: cnicBack == null
                            ? IconContent(
                                icon: Icons.camera_alt,
                                gender: "CNIC Back",
                              )
                            : showCnicBackImage(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 50,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonalInformations(),
                    ),
                  );
                },
                color: kThemeColor,
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
