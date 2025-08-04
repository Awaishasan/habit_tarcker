import 'package:flutter/cupertino.dart';

class CounterController extends ChangeNotifier{
  int _count =0;

  int get count{
    return _count;
  }

     set count(int newCount){
     this._count = newCount;

  }


  void increment(){
    _count++;
    notifyListeners();
  }

  void decremennt(){
    if(_count > 0){
      _count--;


    }
    notifyListeners();
  }
}