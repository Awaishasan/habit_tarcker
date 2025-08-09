import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider_practice/constants/app_button.dart';
import 'package:provider_practice/constants/appcolour.dart';
import 'package:provider_practice/constants/space_extension.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColour.bg,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SafeArea(child: Column(children: [
          119.veritcal,
          Text("Verification Code",style: TextStyle(fontSize: 25),),
          Text("Enter OTP code we’ve sent to your email",style: TextStyle(fontSize: 14),),
          46.veritcal,
          OtpTextField(
            numberOfFields: 6,
            borderColor: Color(0xFFEDEDED),

            borderRadius: BorderRadius.circular(8),
            fillColor: Colors.blue.shade50,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            filled: true,
            showFieldAsBox: true,
            showCursor: true,

            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            onCodeChanged: (String code) {
              // handle validation or live changes
            },
            onSubmit: (String verificationCode) {
              print("OTP Entered: $verificationCode");
              // Do something with the OTP
            },
          ),
          20.veritcal,
          AppButton(ontab: (){}, btnName: "Submit")


        ],)),
      ),);
  }
}
