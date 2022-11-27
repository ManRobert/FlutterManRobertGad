import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Tic-Tac-Toe';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: const Center(
            child: Text(
              _title,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Color color = Colors.green;
  Color? theWinningColor;
  List<Color>? list = <Color>[
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];

  void checkTheGame() {
    Color theWinningColor = Colors.white;

    // check the Horizontals
    if (theWinningColor == Colors.white) {
      for (int i = 0; i <= 6; i = i + 3) {
        if ((list![i] == list![i + 1]) &&
            (list![i] == list![i + 2]) &&
            list![i] != Colors.white) {
          theWinningColor = list![i];
        }
      }
    }

    // check the Verticals
    if (theWinningColor == Colors.white) {
      for (int i = 0; i <= 2; i++) {
        if ((list![i] == list![i + 3]) &&
            (list![i] == list![i + 6]) &&
            list![i] != Colors.white) {
          theWinningColor = list![i];
        }
      }
    }

    // check the main diagonal
    if (theWinningColor == Colors.white) {
      if ((list![0] == list![4]) &&
          (list![0] == list![8]) &&
          list![0] != Colors.white) {
        theWinningColor = list![0];
      }
    }

    // check the second diagonal
    if (theWinningColor == Colors.white) {
      if ((list![2] == list![4]) &&
          (list![2] == list![6]) &&
          list![2] != Colors.white) {
        theWinningColor = list![2];
      }
    }

    // check if there are still valid moves
    int i;
    for (i = 0; i <= 8; i++) {
      if (list![i] == Colors.white) {
        break;
      }
    }

    setState(() {
      if (theWinningColor != Colors.white) {
        for (int i = 0; i <= 8; i++) {
          list![i] = theWinningColor;
        }
      } else if (i == 9) {
        for (int i = 0; i <= 8; i++) {
          list![i] = Colors.black;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      primary: false,
      children: <Widget>[
        for (int i = 0; i <= 8; i++)
          GestureDetector(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black87),
                color: list![i],
              ),
            ),
            onTap: () {
              setState(() {
                if (list![i] == Colors.white) {
                  list![i] = color;
                  checkTheGame();
                  if (color == Colors.green) {
                    color = Colors.red;
                  } else {
                    color = Colors.green;
                  }
                }
              });
            },
          ),
        Container(
          padding: const EdgeInsets.all(8),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                for (int i = 0; i <= 8; i++) {
                  list![i] = Colors.white;
                }
              });
            },
            child: const Text('Reset'),
          ),
        )
      ],
    );
  }
}
