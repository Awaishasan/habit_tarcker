import 'package:flutter/cupertino.dart';

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 92, 1)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;


    Path path_0 = Path();
    path_0.moveTo(0,size.height*0.9894180);
    path_0.lineTo(size.width*0.0028571,size.height*-0.0052910);
    path_0.quadraticBezierTo(size.width*0.7507143,size.height*-0.0013228,size.width,0);
    path_0.cubicTo(size.width*0.9840000,size.height*0.1863492,size.width*0.7532286,size.height*0.2834392,size.width*0.5993143,size.height*0.2586243);
    path_0.cubicTo(size.width*0.4088286,size.height*0.2283598,size.width*0.3622571,size.height*0.2703704,size.width*0.3085714,size.height*0.4391534);
    path_0.quadraticBezierTo(size.width*0.1825714,size.height*0.8541799,0,size.height*0.9894180);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);


    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 92, 1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;



    canvas.drawPath(path_0, paint_stroke_0);


    // Layer 1

    Paint paint_fill_1 = Paint()
      ..color = const Color.fromARGB(255, 255, 156, 81)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;


    Path path_1 = Path();
    path_1.moveTo(size.width*0.2800000,size.height*0.9947090);
    path_1.quadraticBezierTo(size.width*0.3080857,size.height*0.4916931,size.width*0.6197143,size.height*0.4498413);
    path_1.quadraticBezierTo(size.width*0.9528286,size.height*0.4359788,size.width*1.0043429,size.height*0.2457143);
    path_1.lineTo(size.width*0.9971429,size.height*0.9947090);
    path_1.lineTo(size.width*0.2800000,size.height*0.9947090);
    path_1.close();

    canvas.drawPath(path_1, paint_fill_1);


    // Layer 1

    Paint paint_stroke_1 = Paint()
      ..color = const Color.fromARGB(255, 252, 187, 132)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;



    canvas.drawPath(path_1, paint_stroke_1);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
