import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/configuration/approuter.dart';
import 'package:provider_practice/constants/app_images.dart';
import 'package:provider_practice/constants/appcolour.dart';
import 'package:provider_practice/constants/space_extension.dart';

import '../constants/app_button.dart';
import '../constants/app_text_feild.dart';
import '../controller/signUpController.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final _fromstate = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {

    final signUpProvider = Provider.of<SignupController>(context,listen: false);
    return Form(
      key: _fromstate,
      child: Scaffold(
        backgroundColor: AppColour.bg,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  48.veritcal,
                  Row(
                    children: [
                      Text(
                        "Sign Up",
                        style:
                            TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
                      ),
                      130.horizental,
                      Consumer<SignupController>(builder: (context, value, child) => GestureDetector(
                        onTap: ()=> value.gotoLoginScreen(),
                        child: Text(
                          "log In",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                      ),),

                      10.horizental,
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.orange,
                      )
                    ],
                  ),
                  
                  40.veritcal,
                  // name text field
                  Padding(
                    padding: const EdgeInsets.only(right: 300),
                    child: Text(
                      "Name",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  12.veritcal,
                  AppTextFeild(
                    message: "Enter name",
                    Controller: signUpProvider.nameController,
                  ),
                  // Email Text field
                  18.veritcal,
                  Padding(
                    padding: const EdgeInsets.only(right: 300),
                    child: Text(
                      "Email",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  12.veritcal,
                  AppTextFeild(
                    message: "Enter Email",
                    Controller: signUpProvider.emailController,
                  ),
                  
                  // password text field
                  18.veritcal,
                  Padding(
                    padding: const EdgeInsets.only(right: 280),
                    child: Text(
                      "Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  12.veritcal,
                  
                  Consumer<SignupController>(builder:(context, value, child) {
                    return  AppTextFeild(
                        message: "Enter password",
                        isObsured: value.PasswordObscured,
                        Controller: value.passwordController,
                        sufixIcons: IconButton(
                            onPressed: () => value.togglePassword(),
                            icon: Icon(value.PasswordObscured
                                ? Icons.visibility_off
                                : Icons.visibility))
                    );
                  }, ),
                  
                  
                  // confrim password text field
                  18.veritcal,
                  Padding(
                    padding: const EdgeInsets.only(right: 230),
                    child: Text(
                      "Confrim Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  12.veritcal,
                  Consumer<SignupController>(builder: (context, value, child) {
                    return   AppTextFeild(
                        message: "Enter password",
                        isObsured: value.ConfrimPasswordObscured,
                        Controller: value.confirmPassword,
                        sufixIcons: IconButton(
                            onPressed: () => value.toggleConfrimPassword(),
                            icon: Icon(value.ConfrimPasswordObscured
                                ? Icons.visibility_off
                                : Icons.visibility)));
                  },),
                  
                  
                  // app button custom  app button
                  35.veritcal,
                  Consumer<SignupController>(builder: (context, value, child) => AppButton(

                    btnName: "Sign Up",
                    ontab: () {
                      if (_fromstate.currentState!.validate()) {


                        value.sigin();



                        // ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(content: Text("data store successfully")));
                      }
                    },
                  ),),

                  
                  20.veritcal,
                  
                  Text("Or sign up with "),
                  20.veritcal,

                  Consumer<SignupController>(builder: (context, value, child) => GestureDetector(
                    onTap: (){
                      value.googleSignIn();

                    },
                    child: Container(
                        height: 52,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),

                            boxShadow: [
                              BoxShadow(color: Colors.grey.withOpacity(0.5)
                                  ,blurRadius: 5,
                                  spreadRadius: 5,
                                  offset: Offset(4, 5)

                              )

                            ]
                        ),
                        child: Image.asset(AppImages.googleIcons)),
                  ),)
                  

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
