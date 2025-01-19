import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_game/data/provider/data_provider.dart';

class CustomButtonsForHome extends StatelessWidget {
  final String title;

  final nextPage;
  final TextEditingController? contr;

  const CustomButtonsForHome({
    super.key,
    required this.title,
    required this.contr,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: GestureDetector(
        onTap: () {
          if (contr!.text.isNotEmpty && contr!.text != '') {
            context.read<DataProvider>().setUerName(contr!.text);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => nextPage),
            );
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Alert'),
                  content: Text('Please enter Name before moving forward'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.pink[400],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.pink),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'bold',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
