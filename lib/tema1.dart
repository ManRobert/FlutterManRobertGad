import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  double? input = 0;
  String? error;
  double? number;
  String output = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Convertor')),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              const Image(
                image: NetworkImage(
                  'https://www.marxist.com/images/stories/economy/Money'
                  '_-_Pictures_of_Money--Flickr_flickr.com--photos--'
                  'pictures-of-money--17123251389.jpg',
                  scale: 2,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  errorText: error,
                  hintText: 'Enter the amount in EUR',
                ),
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  setState(() {
                    if (value != '') {
                      input = double.tryParse(value);
                      if (input == null) {
                        error = 'Please enter a corect number!';
                        output = '';
                      } else {
                        number = input! * 4.93;
                        number = double.parse(number!.toStringAsFixed(2));
                        error = '';
                      }
                    } else {
                      error = 'Please enter a number!';
                      output = '';
                    }
                  });
                },
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    output = '$number';
                  });
                },
                child: const Text('CONVERT!'),
              ),
              Text(
                output,
                style: const TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
