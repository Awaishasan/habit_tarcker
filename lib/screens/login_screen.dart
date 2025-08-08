import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/configuration/approuter.dart';
import 'package:provider_practice/constants/app_button.dart';
import 'package:provider_practice/constants/app_text_feild.dart';
import 'package:provider_practice/constants/appcolour.dart';
import 'package:provider_practice/constants/space_extension.dart';

import '../constants/app_images.dart';
import '../controller/loginController.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _fromSate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginController>(context, listen: false);
    return Form(
      key: _fromSate,
      child: Scaffold(
        backgroundColor: AppColour.bg,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  62.veritcal,
                  Row(
                    children: [
                      Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      140.horizental,
                      Consumer<LoginController>(builder: (context, value, child) =>  GestureDetector(
                        onTap: ()=> value.gotoSignUpScreen(),
                        child: Text(
                          "Sign up",
                          style: TextStyle(fontSize: 15, color: Color(0xffFF5C00)),
                        ),
                      ),),

                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Color(0xffFF5C00),
                      )
                    ],
                  ),
                  53.veritcal,
                  Padding(
                    padding: const EdgeInsets.only(right: 300),
                    child: Text(
                      "Name",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  12.veritcal,
                  AppTextFeild(
                      message: "Name", Controller: loginProvider.nameController),
                  40.veritcal,
                  Padding(
                    padding: const EdgeInsets.only(right: 280),
                    child: Text(
                      "Password",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  12.veritcal,
                  Consumer<LoginController>(
                    builder: (context, value, child) {
                      return AppTextFeild(
                        message: "Password",
                        isObsured: value.PasswordObscured,
                        Controller: loginProvider.PasswordController,
                        sufixIcons: IconButton(
                            onPressed: () => value.togglePassword(),
                            icon: Icon(value.PasswordObscured
                                ? Icons.visibility_off
                                : Icons.visibility)),
                      );
                    },
                  ),
                  Row(
                    children: [
                      Consumer<LoginController>(
                          builder: (context, loginProvider, child) => Checkbox(
                              value: loginProvider.checkBoxValue,
                              onChanged: (bool? newValue) {
                                loginProvider.onChange(newValue ?? false);
                              })),
                      Text(
                        "Remember me",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w900,
                            fontSize: 15),
                      ),
                      70.horizental,
                      Consumer<LoginController>(builder: (context, value, child) => GestureDetector(
                          onTap: ()=> value.gotoForgetPasswordScreen(),
                          child: Text("Forget Password?",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Color(0xffFF5C00)),)),)

                    ],
                  ),
                  70.veritcal,
                  AppButton(
                      btnName: "log in",
                      ontab: () {
                        if (_fromSate.currentState!.validate()) {

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Login succesfully")));
                        }
                      }),
                  55.veritcal,

                  Text("Or Log in with "),
                  24.veritcal,

                  Container(
                      height: 52,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(AppImages.googleIcons))

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
