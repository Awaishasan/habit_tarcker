import 'package:flutter/material.dart';
import 'package:provider_practice/constants/pop_menu_button.dart';
import 'package:provider_practice/constants/space_extension.dart';

class HabitCart extends StatelessWidget {
  final String title;
  final int progress;
  final int target;
  final String frequency;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  const HabitCart(
      {super.key,
      required this.title,
      required this.progress,
      required this.target,
      required this.frequency,
      required this.onEdit,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    double progressValue = progress/target;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              popMenuButton(onEdit: onEdit, onDelete: onDelete)
            ],),
            7.veritcal,
            LinearProgressIndicator(
              value: progressValue,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
              borderRadius: BorderRadius.circular(4),

              minHeight: 13,

            ),
            8.veritcal,
            Text("$progress from $target days targets",style: TextStyle(fontSize: 13, color: Colors.black54),),
            4.veritcal,
            Text(frequency,style: TextStyle(fontSize: 13, color: Colors.redAccent),)
          ],
        ),
      ),
    );
  }
}
