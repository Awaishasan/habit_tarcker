import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SignupController extends ChangeNotifier{

  bool _isPasswordObscured = true;
  bool _isConfrimPasswordObscured = true;

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

  @override
  void dispose(){
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

}