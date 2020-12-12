import 'dart:convert';
import 'package:food_delivery_app/routes/routes_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/common_screens/veiry_email.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/common_screens/sign_up_role.dart';
import 'package:http/http.dart' as http;

class SignUpModel extends ChangeNotifier {
  bool isSignUp = true;
  bool isLoading = false;
  bool isCodeSent = false;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var _verificationId;

  // Signup user with phone number
  void onVerifyCode(String number, BuildContext context, countryCode) async {
    isCodeSent = true;
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _firebaseAuth
          .signInWithCredential(phoneAuthCredential)
          .then((UserCredential value) {
        if (value.user.displayName != null && value.user != null) {
          // Handle loogged in state
          print(value.user.phoneNumber);
//           Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(
//                 builder: (context) =>BottomNavBar(
// //                  user: value.user,
//                 ),
//               ),
//                   (Route<dynamic> route) => false);
        } else if (value.user != null && value.user.displayName == null) {
          MaterialPageRoute(
            builder: (context) => SignRole(),
          );
        } else {
          Text("Error validating OTP, try again");
        }
      }).catchError((error) {
        Text("Something went wrong");
      });
    };
    final PhoneVerificationFailed verificationFailed = (authException) {
      Text(authException.message);
      isCodeSent = false;
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      _verificationId = verificationId;
    };
    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
    };

    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: "$countryCode$number",
        timeout: const Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  // on code submit
  void onFormSubmitted(
      TextEditingController _pinEditingController, BuildContext context) async {
    AuthCredential _authCredential = PhoneAuthProvider.getCredential(
        verificationId: _verificationId, smsCode: _pinEditingController.text);

    _firebaseAuth
        .signInWithCredential(_authCredential)
        .then((UserCredential value) {
      if (value.user != null && value.user.displayName != null) {
        // Handle loogged in state
        print(value.user.phoneNumber);
//         Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(
//               builder: (context) => BottomNavBar(
// //                user: value.user,
//               ),
//             ),
//                 (Route<dynamic> route) => false);
      } else if (value.user.displayName == null && value.user != null) {
        MaterialPageRoute(
          builder: (context) => SignRole(),
        );
      } else {
        Text("Error validating OTP, try again");
      }
    }).catchError((error) {
      Text("Something went wrong");
    });
  }

  // signup into signin by bool value
  void changeIntoSignup() {
    isSignUp = !isSignUp;
    notifyListeners();
  }

  // showing error for email sign up
  showError(_error) {
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
                style: kEmailError,
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

  // signUp user with email password
  void signUpUser(String email, String password, BuildContext context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => VerifyEmail()));
    var url =
        "https://unforewarned-rolls.000webhostapp.com/trippApi/signup.php";
    http.Response response = await http.post(url,
        body: ({
          'email': email,
          'password': password,
        }),
        headers: {'Accept': 'application/json'});
    print(response.statusCode);
    var jsonConvert = jsonEncode(response.body);
    notifyListeners();
  }

  // signin user
  void signInUser(String email, String password, BuildContext context) {
    print("sign in User $email");
    print(password);
    isLoading = true;
    Navigator.pushNamed(context, signRole);
    notifyListeners();
  }
}
