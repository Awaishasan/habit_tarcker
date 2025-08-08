import 'package:flutter/cupertino.dart';
import 'package:provider_practice/configuration/approuter.dart';

class LoginController extends ChangeNotifier{

  bool _isPasswordObsurced = true;

  bool _isSelected = false;



  final nameController = TextEditingController();
  final PasswordController= TextEditingController();


  bool get checkBoxValue{
    return _isSelected;
  }


  bool get PasswordObscured{
    return _isPasswordObsurced;
  }

  // check box toggle method

  void onChange(bool value) {
    _isSelected = value;
    notifyListeners();
  }


  void gotoSignUpScreen(){
    AppRouter.push(AppRouter.signupScreen);

  }

  void gotoForgetPasswordScreen(){
    AppRouter.push(AppRouter.forgetPassword);
  }






  // password feild toggle method

  void togglePassword(){
    _isPasswordObsurced = !_isPasswordObsurced;
    notifyListeners();
  }



}