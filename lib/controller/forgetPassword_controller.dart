import 'package:flutter/cupertino.dart';

import '../configuration/approuter.dart';

class ForgetPasswordController extends ChangeNotifier{

  final forgetPasswordController = TextEditingController();

  void gotoOptScreen(){
    AppRouter.push(AppRouter.otpScreen);
  }

}