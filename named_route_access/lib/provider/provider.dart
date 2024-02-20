import 'package:flutter/foundation.dart';

class Counter extends ChangeNotifier{
  int counter = 0;

  void incrementFunction(){
    counter++;
    notifyListeners();
    print(counter);
  }
}