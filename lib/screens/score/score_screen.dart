import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_game/data/provider/data_provider.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: context.read<DataProvider>().getScore.length,
                  itemBuilder: (context, index) {
                    var scoreMap = context.read<DataProvider>().getScore;
                    var sortedEntries = scoreMap.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
                    var entry = sortedEntries[index];
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(),
                        color: Colors.pinkAccent[100],
                      ),
                      child: Row(
                        spacing: 20,
                        children: [
                          Text(
                            (index + 1).toString(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'bold',
                            ),
                          ),
                          Image.asset(
                            "assets/images/avatar.png",
                          ),
                          Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name:  ${entry.key}",
                                style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.black,
                                  fontFamily: 'regular',
                                ),
                              ),
                              Text(
                                "Score: ${entry.value}",
                                style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.black54,
                                  fontFamily: 'regular',
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
