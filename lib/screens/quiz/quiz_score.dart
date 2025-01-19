import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_game/data/provider/data_provider.dart';
import 'package:quiz_game/screens/home/home_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:lottie/lottie.dart'; // Import the lottie package

class QuizScore extends StatefulWidget {
  final Map<int, bool> correctOpt;

  const QuizScore({
    super.key,
    required this.correctOpt,
  });

  @override
  State<QuizScore> createState() => _QuizScoreState();
}

class _QuizScoreState extends State<QuizScore> {
  int count = 0;
  double finalScore = 0;

  @override
  void initState() {
    super.initState();
    calScore();
  }

  void calScore() {
    for (var i = 0; i < widget.correctOpt.values.length; i++) {
      if (widget.correctOpt.values.toList()[i]) {
        count++;
      }
    }

    finalScore = count * 75.5;

    context.read<DataProvider>().setScore(finalScore);
  }

  @override
  Widget build(BuildContext context) {
    double progress = count / 10.0;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        width: double.infinity,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            CircularPercentIndicator(
              radius: 120.0,
              lineWidth: 20.0,
              percent: progress,
              center: Text(
                '$count / 10',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'bold',
                ),
              ),
              progressColor: Colors.pink,
              backgroundColor: Colors.grey[300]!,
              circularStrokeCap: CircularStrokeCap.round,
              animation: true,
              animateFromLastPercent: true,
            ),
            SizedBox(height: 20),
            Text(
              "Total score is : $finalScore%",
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'bold',
              ),
            ),
            if (count == 10) ...[
              SizedBox(height: 30),
              Lottie.asset(
                'assets/congratulations.json',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Text(
                "Congratulations!\nYou got all answers correct!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false,
          );
        },
        backgroundColor: Colors.pink,
        focusColor: Colors.black,
        child: Icon(
          Icons.navigate_next_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
