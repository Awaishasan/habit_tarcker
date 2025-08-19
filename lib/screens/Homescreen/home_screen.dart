import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/constants/app_button.dart';
import 'package:provider_practice/constants/space_extension.dart';
import 'package:provider_practice/utils/habit_cart.dart';

import '../../constants/RPSCustomPainter.dart';
import '../../constants/appcolour.dart';
import '../../controller/home_Provider/home_controller.dart';
import '../../utils/habit_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final habits = Provider.of<HomeController>(context, listen: false);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE, d MMMM yyyy').format(now);
    return Scaffold(
      backgroundColor: AppColour.bg,
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: Color(0xff37C871),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SingleChildScrollView(
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
                      child: ClipRRect(
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
                          begin: Alignment.bottomCenter, // Start from bottom
                          end: Alignment.topCenter, // End at the middle
                          colors: [
                            Color(0xffFF8636), // Orange
                            Color(0xffFF8636)
                                .withOpacity(0.0), // Transparent fade
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                //  today habits container  ////////////////////////////////
                20.veritcal,
                Container(
                  width: double.infinity,
                  height: 297,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(2, 5))
                    ],
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Today Habit",
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "see All",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            )
                          ],
                        ),
                      ),
                      Consumer<HomeController>(
                        builder: (context, value, child) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: value.habits.length,
                              itemBuilder: (context, index) {
                                final habit = value.habits[index];
                                return HabitItems(
                                  title: habit.title,
                                  isComplete: habit.isCompleted,
                                  onToggle: () => value.toggleHabit(index),
                                  onEdit: () => value.showEditDialog(
                                    context,
                                    value,
                                    index,
                                    habit.title,
                                  ),
                                  onDelete: () => value.deleteHabit(index),
                                );
                              },
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                30.veritcal,
                Container(
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(5, 4))
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Your Goals",
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "see All",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            )
                          ],
                        ),
                      ),
                      Consumer<HomeController>(
                        builder: (context, value, child) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: value.GoalProgress.length,
                              itemBuilder: (context, index) {
                                final Goalprog = value.GoalProgress[index];
                                return HabitCart(
                                    title: Goalprog.title,
                                    progress: Goalprog.progress,
                                    target: Goalprog.target,
                                    frequency: Goalprog.frequency,
                                    onEdit: () => value.showEditDialog(context,
                                      value,
                                      index,
                                      Goalprog.title,),
                                    onDelete: () => value.deleteHabit(index));
                              },
                            ),
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
