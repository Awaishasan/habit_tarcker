import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider_practice/constants/space_extension.dart';

import '../../constants/RPSCustomPainter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE, d MMMM yyyy').format(now);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formattedDate,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              RichText(
                text: TextSpan(
                    text: 'Hello ',
                    style: const TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: "Susy!",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 28,
                              fontWeight: FontWeight.bold))
                    ]),
              ),
              16.veritcal,
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 189,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Color(0xffFF8636)),
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: CustomPaint(
                        size: Size(MediaQuery.of(context).size.width, 189),
                        painter: RPSCustomPainter(),
                      ),
                    ),

                  ),
                  Container(
                    width: double.infinity,
                    height: 189,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),

                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,  // Start from bottom
                        end: Alignment.topCenter,          // End at the middle
                        colors: [
                          Color(0xffFF8636),             // Orange
                          Color(0xffFF8636).withOpacity(0.0), // Transparent fade
                        ],
                      ),
                    ),
                  )

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
