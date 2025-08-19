import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_practice/model/habit_model.dart';

import '../../model/habit_prograss.dart';

class HomeController extends ChangeNotifier{

  List<Habit> _habit = [
    Habit(title: "Meditating",isCompleted:  true),
    Habit(title: "Read Philosophy",isCompleted:  true),
    Habit(title: "Journaling"),
  ];

  List<habitProgress> _habitProgress=[
    habitProgress(title: 'Finish 5 Philosophy Books', progress: 2, target: 7, frequency: 'EveryDay'),
    habitProgress(title: 'Finsih read The Hobbits', progress: 5, target: 7, frequency: 'EveryDay'),
    habitProgress(title: 'Sleep before 11 pm', progress: 5, target: 7, frequency: 'EveryDay'),

  ];

  List<Habit> get habits => _habit;

  List<habitProgress>  get GoalProgress => _habitProgress;


  void toggleHabit(int index){
    _habit[index].toggleCompletion();
    notifyListeners();

  }


  void deleteHabit(int index){
    _habit.removeAt(index);
    notifyListeners();

  }

  void editHabit(int index, String newTitle) {
    _habit[index].title = newTitle;
    notifyListeners();
  }


  void showEditDialog(
      BuildContext context, HomeController controller, int index, String oldTitle) {
    final TextEditingController textController = TextEditingController(text: oldTitle);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Habit"),
          content: TextField(
            controller: textController,
            decoration: const InputDecoration(labelText: "Habit Title"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                controller.editHabit(index, textController.text);
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

}