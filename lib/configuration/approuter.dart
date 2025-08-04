import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screens/forget_password.dart';
import '../screens/login_screen.dart';
import '../screens/new_password.dart';
import '../screens/otp_screen.dart';
import '../screens/signup_screen.dart';

class AppRouter {
  static const String signupScreen = "/signupScreen";
  static const String loginScreen = "/loginScreen";
  static const String forgetPassword = "/forgetPassword";
  static const String otpScreen = "/otpScreen";
  static const String newPassword = "/newPassword";

  static Map<String, WidgetBuilder>  get routes => {
    signupScreen: (context)=> SignupScreen(),
    loginScreen: (context)=> LoginScreen(),
    forgetPassword: (context)=> ForgetPassword(),
    otpScreen: (context)=> OtpScreen(),
    newPassword: (context)=> NewPassword(),
  };
}