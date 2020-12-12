import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/resturant_app/views/signup/general_informations.dart';
import 'package:food_delivery_app/constants.dart';

class ResturantPhoneSignup extends StatefulWidget {
  @override
  _ResturantPhoneSignupState createState() => _ResturantPhoneSignupState();
}

class _ResturantPhoneSignupState extends State<ResturantPhoneSignup> {
  static String _phoneController;
  final _codeController = TextEditingController();

  Future loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          var result = await _auth.signInWithCredential(credential);

          User user = result.user;

          if (user != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => GeneralInformations(),
              ),
            );
          } else {
            print("Error");
          }

          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (exception) {
          print(exception.message);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Give the code?"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: kThemeColor,
                      onPressed: () async {
                        final code = _codeController.text.trim();
                        AuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: verificationId, smsCode: code);

                        var result =
                            await _auth.signInWithCredential(credential);

                        User user = result.user;

                        if (user != null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GeneralInformations(),
                            ),
                          );
                        } else {
                          print("Error");
                        }
                      },
                    )
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter your\nmobile number",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We'll Text you a verification code. message and data rates may apply",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: TextField(
                  onChanged: (val) {
                    _phoneController = val;
                  },
                  decoration: InputDecoration(
                      hintText: "+966 55 921 8735",
                      prefixIcon: Icon(Icons.call)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Card(
                color: kThemeColor,
                shadowColor: Colors.black,
                elevation: 8.0,
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kThemeColor,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      final phone = _phoneController;
                      loginUser(phone, context);
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
