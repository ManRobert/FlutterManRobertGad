import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> _titles = <String>[];
  final List<String> _images = <String>[];
  /*final List<String> _genres = <String>[];*/
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _getMovies();
  }

  void _getMovies() {
    setState(() => _isLoading = true);
    _isLoading = true;
    get(Uri.parse('https://yts.mx/api/v2/list_movies.json')).then((
      Response response,
    ) {
      final Map<String, dynamic> map =
          jsonDecode(response.body) as Map<String, dynamic>;
      final Map<String, dynamic> data = map['data'] as Map<String, dynamic>;
      final List<Map<dynamic, dynamic>> movies =
          List<Map<dynamic, dynamic>>.from(
        data['movies'] as List<dynamic>,
      );
      for (final Map<dynamic, dynamic> item in movies) {
        _titles.add(item['title'] as String);
        _images.add(item['medium_cover_image'] as String);

        /*for (int i = 0; i <= 2 ;i++) {
          _genres.add(item['genres'][i]as String);
        }*/
      }

      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Center(child: Text('Movies')),
      ),
      body: Builder(
        builder: (BuildContext context) {
          if (_isLoading) {
            return const Center(child: CircularProgressIndicator(color: Colors.black,));
          }
          return PageView.builder(
            itemBuilder: (BuildContext buildContext, int index) {
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
                    child: Container(
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: MediaQuery.of(context).size.height / 1.8,
                      decoration: BoxDecoration(
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            blurRadius: 25,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(_images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Expanded(
                      child: Text(
                        _titles[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  /*Text(_genres[index][0],style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),)*/
                ],
              );
            },
          );
        },
      ),
    );
  }
}
