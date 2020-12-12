import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/common_clip_paths/signup_uper_clip.dart';
import 'package:food_delivery_app/models/sign_up_model.dart';
import 'package:provider/provider.dart';

GlobalKey<FormState> _key = GlobalKey<FormState>();

class EmailSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _error;
    String email;
    String password;
    final providerEmailModel = Provider.of<SignUpModel>(context);
    return Scaffold(
      body: providerEmailModel.isLoading
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
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        providerEmailModel.isSignUp
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
            providerEmailModel.showError(_error),
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
                              email = val;
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
                              password = val;
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
                          child: providerEmailModel.isSignUp
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
                            if(_key.currentState.validate()){
                              if(providerEmailModel.isSignUp == true){
                                providerEmailModel.signInUser(email, password,context);
                              }else{
                                providerEmailModel.signUpUser(email, password,context);
                              }
                            }
                          },
                          color: kThemeColor,
                          child: Text(
                            providerEmailModel.isSignUp ? "Login" : "SignUp",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(providerEmailModel.isSignUp
                                  ? "Don't have an account?"
                                  : "Already have an account?"),
                              FlatButton(
                                onPressed: () {
                                  providerEmailModel.changeIntoSignup();
                                },
                                child:
                                Text(providerEmailModel.isSignUp ? "SignUp" : "Signin"),
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
