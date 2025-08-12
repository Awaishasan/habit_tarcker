import 'package:flutter/cupertino.dart';
import 'package:provider_practice/configuration/approuter.dart';
import 'package:provider_practice/firebase_service/firebase_service.dart';

class LoginController extends ChangeNotifier{

  bool _isPasswordObsurced = true;

  bool _isSelected = false;

  final FirebaseService _firebaseService = FirebaseService();



  final emailController = TextEditingController();
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


  void login() async {
    final user = _firebaseService.loginWithEmailandPassword(
        emailController.text.trim(), PasswordController.text.trim());
    AppRouter.push(AppRouter.homeScreen);
    print("User login successfully");
  }






  // password feild toggle method

  void togglePassword(){
    _isPasswordObsurced = !_isPasswordObsurced;
    notifyListeners();
  }



}