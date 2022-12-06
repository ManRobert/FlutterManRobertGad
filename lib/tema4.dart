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

  final Map<String, dynamic> _genres = <String, dynamic>{};
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _getMovies();
  }

  void _getMovies() {
    setState(() => _isLoading = true);
    // get the movies
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
        // get the titles
        _titles.add(item['title'] as String);

        // get the images
        _images.add(item['medium_cover_image'] as String);

        // get the genres
        final List<dynamic> list = item['genres'] as List<dynamic>;
        String movieCategory = '';
        final StringBuffer buffer = StringBuffer();
        final int listLength = list.length;
        for (int i = 0; i < listLength; i++) {
          buffer.write(list[i]);
          if (listLength - i > 1) {
            buffer.write('/');
          }
        }
        movieCategory = buffer.toString();
        _genres[item['title'] as String] = movieCategory;
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
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          return PageView.builder(
            itemCount: _titles.length,
            itemBuilder: (BuildContext buildContext, int index) {
              return Column(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
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
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      _titles[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    _genres[_titles[index]] as String,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
