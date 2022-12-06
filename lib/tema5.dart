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
  final ScrollController _controller = ScrollController();
  final List<Movie> _movies = <Movie>[];
  late bool _isLoading;
  int _page = 1;

  @override
  void initState() {
    super.initState();
    _getMovies();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (_controller.offset >
            _controller.position.maxScrollExtent -
                MediaQuery.of(context).size.height &&
        !_isLoading) {
      _getMovies();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _getMovies() async {
    setState(() => _isLoading = true);
    // get the movies
    final Response response = await get(
      Uri.parse(
        'https://yts.mx/api/v2/list_movies.json?limit=20&page=$_page',
      ),
    );
    final Map<String, dynamic> map =
        jsonDecode(response.body) as Map<String, dynamic>;
    final Map<String, dynamic> data = map['data'] as Map<String, dynamic>;
    final List<Map<dynamic, dynamic>> movies = List<Map<dynamic, dynamic>>.from(
      data['movies'] as List<dynamic>,
    );
    _movies.addAll(
      movies.map((Map<dynamic, dynamic> item) => Movie.fromJson(item)),
    );

    _page = _page + 1;

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Movies')),
      ),
      body: SafeArea(
        child: Builder(
          builder: (BuildContext context) {
            if (_isLoading && _page == 1) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
            return ListView.builder(
              controller: _controller,
              itemCount: _movies.length + 1,
              itemBuilder: (BuildContext buildContext, int index) {
                if (_movies.length == index) {
                  if (_isLoading) {
                    return const Padding(
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 8,
                      ),
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
                            image: NetworkImage(_movies[index].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        _movies[index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      _movies[index].genres,
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
      ),
    );
  }
}

class Movie {
  Movie(this.title, this.image, this.genres);

  Movie.fromJson(Map<dynamic, dynamic> item)
      : title = item['title'] as String,
        image = item['medium_cover_image'] as String,
        genres = item['genres']
            .toString()
            .substring(1)
            .substring(0, item['genres'].toString().length - 2);

  final String title;
  final String image;
  final String genres;
}
