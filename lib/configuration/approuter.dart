import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  static final key = GlobalKey<NavigatorState>();

  // static Map<String, WidgetBuilder>  get routes => {
  //   signupScreen: (context)=> SignupScreen(),
  //   loginScreen: (context)=> LoginScreen(),
  //   forgetPassword: (context)=> ForgetPassword(),
  //   otpScreen: (context)=> OtpScreen(),
  //   newPassword: (context)=> NewPassword(),
  // };

  static Route onGenerateRoute(RouteSettings settings) {
    debugPrint('Current Route: ${settings.name}');
    switch (settings.name) {
      case '/':
      case signupScreen:
        return _navigate(SignupScreen());
        case loginScreen:
        return _navigate(LoginScreen());

        case forgetPassword:
        return _navigate(ForgetPassword());

        case otpScreen:
        return _navigate(OtpScreen());

        case newPassword:
        return _navigate(NewPassword());

      default:
        return _onRouteError();
    }



  }


  static Route _onRouteError(){

    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(title: Text("Screen is under development"),),
        body: Center(child: Text("The screen is under development",style: TextStyle(fontSize: 20),)),
      );
    },);
  }




  static Route _navigate(Widget widget) {
    return MaterialPageRoute(builder: (_) => widget);
  }

  static push(String route, {Object? arguments}) {

    key.currentState!.pushNamed(route, arguments: arguments);
  }

}

