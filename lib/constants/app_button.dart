import 'package:flutter/cupertino.dart';

class AppButton extends StatelessWidget {
  final VoidCallback ontab;
  final String btnName;


  const AppButton({super.key, required this.ontab, required this.btnName,});

  @override
  Widget build(BuildContext context) {
    bool isSelected = true;
    return GestureDetector(
      onTap: ontab,
      child: Container(
        height: 52,
        width: double.infinity,
        decoration: BoxDecoration(

          border:  Border.all(strokeAlign: BorderSide.strokeAlignCenter),
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
  }
}
