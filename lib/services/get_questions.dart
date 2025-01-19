import 'dart:convert';
import 'dart:developer';

import 'package:quiz_game/models/quiz_model.dart';
import 'package:http/http.dart' as http;

String url = "https://api.jsonserve.com/Uw5CrX";
Future<QuizModel> getQuestion() async {
  try {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = QuizModel.fromJson(jsonDecode(response.body));
      return data;
    } else {
      log("Cant fetch data");
    }
  } catch (e) {
    log("Something went wrong : $e");
  }
  throw Exception('Failed to load top headliness');
}
