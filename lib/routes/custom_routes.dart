import 'package:flutter/material.dart';
import 'package:food_delivery_app/common_screens/email_signup.dart';
import 'package:food_delivery_app/common_screens/phone_code_verify.dart';
import 'package:food_delivery_app/common_screens/phone_signup.dart';
import 'package:food_delivery_app/common_screens/sign_up_role.dart';
import 'package:food_delivery_app/common_screens/sign_up_welcome_screen.dart';
import 'package:food_delivery_app/common_screens/veiry_email.dart';
import 'package:food_delivery_app/condition_screen.dart';
import 'package:food_delivery_app/customer_app/navigation_bar/navigation_bar.dart';
import 'package:food_delivery_app/customer_app/views/home/map_screen.dart';
import 'package:food_delivery_app/customer_app/views/home/markeets/markeets.dart';
import 'package:food_delivery_app/customer_app/views/home/resturants/resturants.dart';
import 'package:food_delivery_app/customer_app/views/home_page.dart';
import 'package:food_delivery_app/customer_app/views/orders/orders.dart';
import 'package:food_delivery_app/customer_app/views/orders/view_orders.dart';
import 'package:food_delivery_app/customer_app/views/profile/about_us.dart';
import 'package:food_delivery_app/customer_app/views/profile/create_profile.dart';
import 'package:food_delivery_app/customer_app/views/profile/feedback.dart';
import 'package:food_delivery_app/customer_app/views/profile/help.dart';
import 'package:food_delivery_app/customer_app/views/profile/privacy_policy.dart';
import 'package:food_delivery_app/customer_app/views/profile/profile.dart';
import 'package:food_delivery_app/customer_app/views/wallet/all_transactions.dart';
import 'package:food_delivery_app/customer_app/views/wallet/wallet.dart';
import 'package:food_delivery_app/not_found_page.dart';
import 'package:food_delivery_app/routes/routes_names.dart';
import 'package:food_delivery_app/start_app_screen.dart';

class CustomRoutes {
  static Route<dynamic> allRoutes(RouteSettings setting) {
    switch (setting.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => HOmePage());
      case startAppScreen:
        return MaterialPageRoute(builder: (_) => StartAppScreen());
      case conditionScreen:
        return MaterialPageRoute(builder: (_) => ConditionScreen());
      case navigationBar:
        return MaterialPageRoute(builder: (_) => NavigationBar());
      case markeets:
        return MaterialPageRoute(builder: (_) => Markeets());
      case resturants:
        return MaterialPageRoute(builder: (_) => Resturants());
      case mapScreen:
        return MaterialPageRoute(builder: (_) => MapScreen());
      case aboutUs:
        return MaterialPageRoute(builder: (_) => AboutUs());
      case feedBack:
        return MaterialPageRoute(builder: (_) => FeedBack());
      case help:
        return MaterialPageRoute(builder: (_) => Help());
      case privacyPolicy:
        return MaterialPageRoute(builder: (_) => PrivacyPolicy());
      case createProfile:
        return MaterialPageRoute(builder: (_) => CreateProfile());
      case profile:
        return MaterialPageRoute(builder: (_) => ProfileView());
      case emailSignUp:
        return MaterialPageRoute(builder: (_) => EmailSignUp());
      case emailVerify:
        return MaterialPageRoute(builder: (_) => VerifyEmail());
      case phoneSignUp:
        return MaterialPageRoute(builder: (_) => PhoneSignUp());
      case phoneVerify:
        return MaterialPageRoute(builder: (_) => PhoneCodeVerify());
      case signUpWelcome:
        return MaterialPageRoute(builder: (_) => SignUpWelcome());
      case signRole:
        return MaterialPageRoute(builder: (_) => SignRole());
      case orders:
        return MaterialPageRoute(builder: (_) => Orders());
      case viewOrders:
        return MaterialPageRoute(builder: (_) => ViewOrders());
      case wallet:
        return MaterialPageRoute(builder: (_) => Wallet());
      case allTransactions:
        return MaterialPageRoute(builder: (_) => AllTransactions());
    }
    return MaterialPageRoute(builder: (_) => NotFoundPage());
  }
}
