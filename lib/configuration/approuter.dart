import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';

class AppRouter {
  static const String signupScreen = "/signupScreen";
  static const String loginScreen = "/loginScreen";

  static Map<String, WidgetBuilder>  get routes => {
    signupScreen: (context)=> SignupScreen(),
    loginScreen: (context)=> LoginScreen(),
  };
}