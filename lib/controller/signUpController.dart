import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/configuration/approuter.dart';
import 'package:provider_practice/firebase_service/firebase_service.dart';

import '../model/user_model.dart';

class SignupController extends ChangeNotifier{

  bool _isPasswordObscured = true;
  bool _isConfrimPasswordObscured = true;

  final FirebaseService _firebaseService = FirebaseService();

  final passwordController = TextEditingController();
  final confirmPassword = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  bool get PasswordObscured{
    return _isPasswordObscured;
  }

  bool get ConfrimPasswordObscured{
    return _isConfrimPasswordObscured;
  }

  void togglePassword(){
    _isPasswordObscured = !_isPasswordObscured;
    notifyListeners();
  }

  void toggleConfrimPassword(){
    _isConfrimPasswordObscured = !_isConfrimPasswordObscured;
    notifyListeners();
  }

  void gotoLoginScreen(){
    AppRouter.push(AppRouter.loginScreen);
  }

  void clearFeilds(){
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  void sigin()async{
    final user =  await _firebaseService.createUserEmailandPassword(
        emailController.text.trim(),
        passwordController.text.trim());
    if(user != null){
      final userModel = UserModel(
          uid: user.uid,
          email: user.email ?? "",
          userName: nameController.text.trim());

      AppRouter.push(AppRouter.loginScreen);
      await _firebaseService.storeUserData(userModel);
      clearFeilds();

    }

  }

  void googleSignIn()async{
    await _firebaseService.googleSignin();
    AppRouter.push(AppRouter.homeScreen);


  }

  @override
  void dispose(){
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

}