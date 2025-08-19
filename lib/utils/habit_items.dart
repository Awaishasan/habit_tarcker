import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_practice/constants/space_extension.dart';

import '../constants/pop_menu_button.dart';

class HabitItems extends StatelessWidget {
  final String title;
  final bool isComplete;
  final VoidCallback onToggle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const HabitItems({
    super.key,
    required this.title,
    required this.isComplete,
    required this.onToggle,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: isComplete ? Colors.green.shade50 : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                decoration: isComplete ? TextDecoration.lineThrough : null,
                color: isComplete ? const Color(0xff37C871) : Colors.black,
              ),
            ),

            // check field + menu button
            Row(
              children: [
                GestureDetector(
                  onTap: onToggle,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          color: isComplete
                              ? const Color(0xff37C871)
                              : Colors.black),
                      gradient: isComplete
                          ? const LinearGradient(
                          colors: [Color(0xff37C871), Color(0xff5FE394)])
                          : null,
                    ),
                    child: isComplete
                        ? const Icon(Icons.check,
                        size: 18, color: Colors.white)
                        : null,
                  ),
                ),
                12.veritcal,
                popMenuButton(
                  onEdit: onEdit,
                  onDelete: onDelete,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
