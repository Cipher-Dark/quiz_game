import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  String name = '';
  String get getUserName => name;

  int _totalQuestions = 0;
  int get getTotalQuestions => _totalQuestions;
  final Map<String, double> _score = {
    "Sagar": 1220,
    "Rahul": 1320,
    "Karan": 12000,
  };
  Map<String, double> get getScore => _score;
  void setScore(double score) {
    _score[name] = score;
    notifyListeners();
  }

  void setUerName(String value) {
    name = value;
    notifyListeners();
  }

  void setTotalQuestions(int len) {
    _totalQuestions = len;
    notifyListeners();
  }
}
