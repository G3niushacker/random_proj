import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/resturant_app/views/profile/profile.dart';
import 'package:food_delivery_app/resturant_app/views/home/resturant_home.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/common_clip_paths/signup_uper_clip.dart';
import 'package:food_delivery_app/resturant_app/services/firebase_user_id.dart';

const TextStyle kError = TextStyle(color: Colors.red);

class ResturantEmailSignup extends StatefulWidget {
  @override
  _ResturantEmailSignupState createState() => _ResturantEmailSignupState();
}

FirebaseUserId userId = FirebaseUserId();

class _ResturantEmailSignupState extends State<ResturantEmailSignup> {
  String email;
  String password;
  FirebaseAuth _auth = FirebaseAuth.instance;
  signInUserEmail() async {
    try {
      final user = _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResturantHomePage(),
          ),
        );
        setState(() {
          isLoading = true;
          userId.getuserId();
        });
      }
    } catch (e) {
      print(e.message);
    }
  }

  showError() {
    if (_error != null) {
      return Container(
        color: Colors.yellow,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.error_outline,
              color: Colors.red,
            ),
            SizedBox(
              width: 5.0,
            ),
            Expanded(
              child: Text(
                _error,
                style: kError,
              ),
            )
          ],
        ),
      );
    } else {
      return SizedBox(
        height: 0,
      );
    }
  }

  crateUser() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((newUser) {
        if (newUser != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResturantProfile(),
            ),
          );
        }
        setState(() {
          isLoading = true;
          userId.getuserId();
        });
      });
    } catch (e) {
      setState(() {
        _error = e.message;
      });
    }
  }

  bool isSignUp = true;
  bool isLoading = false;
  var _error;
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: kThemeColor,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  ClipPath(
                    clipper: UpperContainerClipper(),
                    child: Container(
                      height: 230,
                      color: kThemeColor,
                      // width: MediaQuery.of(context).size.width,
                      // decoration: BoxDecoration(
                      //     color: kThemeColor,
                      //     borderRadius: BorderRadius.only(
                      //         bottomRight: Radius.circular(100))),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              isSignUp
                                  ? "Welcome Back! \nSignIn"
                                  : "Create\nAccount",
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                  showError(),
                  Card(
                    // elevation: 10.0,
                    shadowColor: Colors.grey,
                    color: Colors.white,
                    child: Container(
                      // height: 450,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.2),
                            blurRadius: 20.0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: _key,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                onChanged: (val) {
                                  setState(() {
                                    email = val;
                                  });
                                },
                                decoration: InputDecoration(hintText: "Email"),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Email is required";
                                  } else if (!RegExp(
                                          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email Address';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                obscureText: true,
                                onChanged: (val) {
                                  setState(() {
                                    password = val;
                                  });
                                },
                                decoration:
                                    InputDecoration(hintText: "Password"),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please Provide Password";
                                  } else if (value.length < 6) {
                                    return "Please Provide Longer then 6";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              Container(
                                child: isSignUp
                                    ? FlatButton(
                                        onPressed: () {},
                                        child: Text("Forot Password?"),
                                      )
                                    : Container(),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 50,
                                onPressed: () {
                                  if (_key.currentState.validate()) {
                                    if (isSignUp = true) {
                                      setState(() {
                                        signInUserEmail();
                                      });
                                    } else {
                                      setState(() {
                                        crateUser();
                                      });
                                    }
                                  }
                                },
                                color: kThemeColor,
                                child: Text(
                                  isSignUp ? "Login" : "SignUp",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      isSignUp
                                          ? "Don't have an account?"
                                          : "Already have an account?",
                                      style: TextStyle(fontFamily: 'Raleway'),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        if (isSignUp == true) {
                                          setState(() {
                                            isSignUp = false;
                                          });
                                        } else {
                                          setState(() {
                                            isSignUp = true;
                                          });
                                        }
                                      },
                                      child:
                                          Text(isSignUp ? "SignUp" : "Signin"),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
