import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/constants/app_button.dart';
import 'package:provider_practice/constants/app_text_feild.dart';
import 'package:provider_practice/constants/space_extension.dart';

import '../controller/forgetPassword_controller.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final forgetPassword =
        Provider.of<ForgetPasswordController>(context, listen: false);
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
              child: Column(
            children: [
              119.veritcal,
              Text(
                "Enter your email below, we will send intruction to reset your password",
                style: TextStyle(fontSize: 14),
              ),
              26.veritcal,
              AppTextFeild(
                  message: "Email",
                  Controller: forgetPassword.forgetPasswordController),
              22.veritcal,
              Consumer<ForgetPasswordController>(
                  builder: (context, value, child) => AppButton(
                      ontab: () {
                        if (_formKey.currentState!.validate()) {
                          value.gotoOptScreen();
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Processing"),duration: Duration(seconds: 2),));
                        }
                      },
                      btnName: "Submit")),
            ],
          )),
        ),
      ),
    );
  }
}
