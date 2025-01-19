import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quiz_game/data/provider/data_provider.dart';
import 'package:quiz_game/screens/help/help_screen.dart';
import 'package:quiz_game/screens/quiz/quizz_screen.dart';
import 'package:quiz_game/screens/score/score_screen.dart';
import 'package:quiz_game/widgets/custom_buttons_for_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    textEditingController.text = context.read<DataProvider>().getUserName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/BG.png"),
              fit: BoxFit.cover,
            ),
            gradient: LinearGradient(colors: [
              Colors.blue,
              Colors.pink
            ], begin: Alignment.topCenter),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'regular',
                      fontSize: 20,
                    ),
                    controller: textEditingController,
                    textAlign: TextAlign.center,
                    enabled: context.read<DataProvider>().getUserName == '',
                    decoration: InputDecoration(
                      labelText: context.read<DataProvider>().getUserName == '' ? "Name" : "",
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'bold',
                      ),
                      hintText: "Enter your name",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'regular',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                CustomButtonsForHome(
                  title: "Start Quiz",
                  nextPage: QuizzScreen(),
                  contr: textEditingController,
                ),
                CustomButtonsForHome(
                  title: "Score",
                  nextPage: ScoreScreen(),
                  contr: textEditingController,
                ),
                CustomButtonsForHome(
                  title: "Help",
                  nextPage: HelpScreen(),
                  contr: textEditingController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
