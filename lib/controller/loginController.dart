import 'package:flutter/cupertino.dart';

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

  // password feild toggle method

  void togglePassword(){
    _isPasswordObsurced = !_isPasswordObsurced;
    notifyListeners();
  }



}