import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/constants/appcolour.dart';

import '../controller/signUpController.dart';

class AppTextFeild extends StatelessWidget {

  String message;
  final IconButton? sufixIcons;
  bool? isObsured;
  final TextEditingController Controller;



    AppTextFeild({super.key ,  required this.message ,  this.sufixIcons, this.isObsured, required this.Controller});


  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 52,
        width: double.infinity,

        decoration: BoxDecoration(
          color: AppColour.colorFeild,
              borderRadius: BorderRadius.circular(10),

        ),
        child: TextFormField(
          controller:  Controller,
          obscureText: isObsured ?? false,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: sufixIcons ,




          ),
          validator: (value) {
            if(value== null || value.isEmpty){
              return  message;

            }
            return null;
          },

        ),
      ),
    );
  }
}
