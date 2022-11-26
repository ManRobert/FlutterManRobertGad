import 'package:flutter/material.dart';

int? number;
String? output = 'You have not entered a number';

bool verifyIfIsSquare(int number) {
  int st = 1;
  int dr = number;
  while (st <= dr) {
    final int mij = (st + dr) ~/ 2;
    if (mij * mij == number) {
      return true;
    }
    if (mij * mij < number) {
      st = mij + 1;
    } else {
      dr = mij - 1;
    }
  }
  return false;
}

bool verifyIfIsTriangular(int number) {
  int st = 1;
  int dr = number;
  while (st <= dr) {
    final int mij = (st + dr) ~/ 2;
    if (mij * mij * mij == number) {
      return true;
    }
    if (mij * mij < number) {
      st = mij + 1;
    } else {
      dr = mij - 1;
    }
  }
  return false;
}

void update(int number) {
  bool isSquare;
  bool isTriangular;
  isSquare = verifyIfIsSquare(number);
  isTriangular = verifyIfIsTriangular(number);
  if (isSquare && isTriangular) {
    output = 'Number ' '$number' ' is both Square and Triangular';
  } else if (isSquare && !isTriangular) {
    output = 'Number ' '$number' ' is Square';
  } else if (!isSquare && isTriangular) {
    output = "Number '$number' is Triangular";
  } else {
    output = "Number '$number' is neither Square or Triangular";
  }
}

void main() {
  runApp(const Homework2());
}

class Homework2 extends StatelessWidget {
  const Homework2({super.key});

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
  int? input = 0;
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Number shapes')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            const Text(
              'Please input a number to see if it is square or triangular:',
              style: TextStyle(fontSize: 25, color: Colors.blueAccent),
            ),
            TextField(
              decoration: InputDecoration(errorText: error),
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                setState(() {
                  input = int.tryParse(value);
                  if (input == null) {
                    error = 'Please enter an integer!';
                  } else {
                    error = null;
                    number = input;
                    update(number!);
                  }
                });
              },
            ),
            const Dialog(),
          ],
        ),
      ),
    );
  }
}

class Dialog extends StatelessWidget {
  const Dialog({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('$number'),
          content: Text(output!),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Check the number'),
    );
  }
}
