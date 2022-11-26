import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const GuessMyNumber());
}

class GuessMyNumber extends StatelessWidget {
  const GuessMyNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String hintFromGame = '';
  String error = '';
  String button = 'Guess';
  int? number;
  String indication = 'Try a number!';
  int? randomNumber = Random().nextInt(100);
  TextEditingController controller = TextEditingController();

  void verify() {
    setState(() {
      if (button == 'Guess') {
        if (number! < randomNumber!) {
          hintFromGame = 'You tried $number. Try higher!';
        } else if (number! > randomNumber!) {
          hintFromGame = 'You tried $number. Try lower!';
        } else {
          hintFromGame = 'You guessed right! It was $number.';
          button = 'Reset';
          indication = 'Please click on Reset!';
          controller.clear();
          hintFromGame = '';
          _dialogBuilder(context);
        }
      }
    });
  }

  void reset() {
    setState(() {
      button = 'Guess';
      number = null;
      controller.clear();
      indication = 'Try a number!';
      randomNumber = Random().nextInt(100);
    });
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('You guessed right!'),
          content: Text(
            'It was $number',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                reset();
                Navigator.pop(context);
              },
              child: const Text('Try again!'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Guess my number')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            children: <Widget>[
              const Text(
                'I am thinking of a number between 1 and 100. Good luck!',
                style: TextStyle(fontSize: 24, color: Colors.black87),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  hintFromGame,
                  style: const TextStyle(fontSize: 25, color: Colors.black87),
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        errorText: error,
                        hintText: indication,
                      ),
                      controller: controller,
                      keyboardType: TextInputType.number,
                      onChanged: (String value) {
                        setState(() {
                          number = int.tryParse(value);
                          if (number == null) {
                            error = 'Please enter an integer!';
                          } else {
                            error = '';
                          }
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (button == 'Guess') {
                          if (number != null) {
                            verify();
                          }
                        } else {
                          reset();
                        }
                      },
                      child: Text(button),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
