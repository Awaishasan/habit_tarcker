

class Habit {
  late String title;
  bool isCompleted;

  Habit({required this.title, this.isCompleted = false});


  void toggleCompletion(){
    isCompleted = !isCompleted;
  }
}