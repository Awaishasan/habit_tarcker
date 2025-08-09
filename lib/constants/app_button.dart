import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../controller/button_press_provider.dart';

class AppButton extends StatelessWidget {
  final VoidCallback ontab;
  final String btnName;




  const AppButton({super.key, required this.ontab, required this.btnName, });

  @override
  Widget build(BuildContext context) {

    return  Consumer<ButtonPressProvider>(builder: (context, pressProvider, child) {
      return  GestureDetector(
        onTapDown: (_)=>  pressProvider.setPressed(true),
        onTapUp: (_) {
          pressProvider.setPressed(false);
          ontab();
        },
       onTapCancel: ()=> pressProvider.setPressed(false),
        child: AnimatedContainer(
          duration: Duration(microseconds: 120),
          height: 52,
          width: double.infinity,
          decoration: BoxDecoration(

              border:    Border.all(
                  strokeAlign: pressProvider.isPressed? BorderSide.strokeAlignCenter: BorderSide.strokeAlignOutside),
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [

                    Color(0xffFF5C00),
                    Color(0xffFFA450),

                  ])
          ),
          child: Center(child: Text(btnName,style: TextStyle(color: Color(0xffffffff),fontSize: 14),)),
        ),
      );
    },);

  }
}



