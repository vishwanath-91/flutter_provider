import 'package:flutter/material.dart';

class Dog extends ChangeNotifier {
  final String name;
  final String breed;
  int age;

  Dog({required this.name, required this.breed, this.age = 1});

  void grow() {
    age++;
    notifyListeners();
  }
}

class Babies extends ChangeNotifier {
  final int age;

  Babies({required this.age});

  Future<int> getBabies() async {
    await Future.delayed(const Duration(seconds: 5));
    if (age >= 5) {
      return 5;
    } else if (age >= 10) {
      return 10;
    } else if (age >= 15) {
      return 15;
    } else {
      return 0;
    }
  }

  Future<String?> bark() async {
    for (int i = 1; i < age; i++) {
      await Future.delayed(const Duration(seconds: 2));
      return 'Bark $i times';
    }
    return null;
  }
}
