import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider_practice/constants/app_button.dart';
import 'package:provider_practice/constants/appcolour.dart';
import 'package:provider_practice/constants/space_extension.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColour.bg,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SafeArea(child: Column(children: [
          119.veritcal,
          Text("Enter new password",style: TextStyle(fontSize: 18),),
          46.veritcal,
          OtpTextField(
            numberOfFields: 5,
            borderColor: Color(0xFFEDEDED),
            showFieldAsBox: true,
            onCodeChanged: (String code) {
              // handle validation or live changes
            },
            onSubmit: (String verificationCode) {
              print("OTP Entered: $verificationCode");
              // Do something with the OTP
            },
          ),
          20.veritcal,
          AppButton(ontab: (){}, btnName: "Reset Your Password")


        ],)),
      ),);
  }
}
