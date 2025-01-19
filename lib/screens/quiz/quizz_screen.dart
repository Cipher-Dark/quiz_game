import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';
import 'package:quiz_game/data/provider/data_provider.dart';
import 'package:quiz_game/models/quiz_model.dart';
import 'package:quiz_game/screens/quiz/quiz_score.dart';
import 'package:quiz_game/services/get_questions.dart';

class QuizzScreen extends StatefulWidget {
  const QuizzScreen({super.key});

  @override
  State<QuizzScreen> createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  late Future<QuizModel> futureData;
  int currentIndex = 0;
  Map<int, int> selectedIndexMap = {};
  Timer? _timer;
  int remainingTime = 600;
  Map<int, bool> correctOptions = {};

  @override
  void initState() {
    super.initState();
    // Lock screen to portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    futureData = getQuestion();
  }

  @override
  void dispose() {
    _timer?.cancel();
    // Restore default screen orientation settings
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var providerRead = context.read<DataProvider>();

    return WillPopScope(
      onWillPop: () async {
        return await _showExitConfirmationDialog() ?? false;
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue[400]!,
                Colors.blue[200]!,
                Colors.red[200]!,
                Colors.red[300]!,
                Colors.pink[300]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: FutureBuilder<QuizModel>(
                    future: futureData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: Text(
                            "Let's get started...",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontFamily: 'bold',
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text("Error: ${snapshot.error}"),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.questions.isEmpty) {
                        return const Center(child: Text("No questions available"));
                      }

                      var data = snapshot.data!;
                      providerRead.setTotalQuestions(data.questions.length);

                      // Start the timer after data is loaded
                      if (_timer == null) {
                        startTimer();
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Text(
                              "Question ${currentIndex + 1} of ${providerRead.getTotalQuestions}",
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              data.questions[currentIndex].description,
                              style: const TextStyle(fontSize: 22),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 350,
                              child: ListView.separated(
                                padding: const EdgeInsets.all(8),
                                itemCount: data.questions[currentIndex].options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  bool isSelected = selectedIndexMap[currentIndex] == index;

                                  return GestureDetector(
                                    onTap: () {
                                      selectAnswer(index, data);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: isSelected ? Colors.pink : Colors.pinkAccent[100],
                                        border: Border.all(),
                                      ),
                                      child: Text(
                                        '${index + 1}. ${data.questions[currentIndex].options[index].description}',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: isSelected ? Colors.white : Colors.black,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) => const Divider(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                bottomArrows(providerRead),
                submitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        _timer?.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => QuizScore(
              correctOpt: correctOptions,
            ),
          ),
        );
        showQuizFinishedPopup();
      }
    });
  }

  void showQuizFinishedPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Time's Up!"),
        content: const Text("The quiz has finished. Your time is up."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void selectAnswer(int index, QuizModel data) {
    setState(() {
      selectedIndexMap[currentIndex] = index;
      correctOptions[currentIndex] = data.questions[currentIndex].options[index].isCorrect;
    });
  }

  Padding bottomArrows(DataProvider providerRead) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 10, right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (currentIndex > 0) {
                  currentIndex--;
                }
              });
            },
            child: const Icon(Icons.arrow_back_ios_new_sharp),
          ),
          Text(
            "Time Left: ${remainingTime ~/ 60}:${(remainingTime % 60).toString().padLeft(2, '0')}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (currentIndex < providerRead.getTotalQuestions - 1) {
                  currentIndex++;
                }
              });
            },
            child: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }

  Padding submitButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () {
          _showSubmitConfirmationDialog();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.pink[800]!),
            borderRadius: BorderRadius.circular(15),
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: Colors.pink,
                blurRadius: 6,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Text(
            'Submit',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'bold',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> _showExitConfirmationDialog() {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Exit'),
          content: const Text('Are you sure you want to exit the quiz? Your progress will be lost.'),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
            TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Exit')),
          ],
        );
      },
    );
  }

  void _showSubmitConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Submission'),
        content: const Text('Are you sure you want to submit your answers?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizScore(
                    correctOpt: correctOptions,
                  ),
                ),
              );
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
