import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:teme_flutter/src/data/movie_api.dart';
import 'package:teme_flutter/src/models/movie.dart';
import 'package:teme_flutter/src/models/torrent.dart';

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
      routes: <String, WidgetBuilder>{
        '/movieDetails': (BuildContext context) {
          return const DetailsPage();
        }
      },
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
  late final List<Movie> _movies = <Movie>[];
  late bool _isLoading;
  int _page = 1;

  @override
  void initState() {
    super.initState();
    _getMovies();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (_controller.offset > _controller.position.maxScrollExtent - MediaQuery.of(context).size.height && !_isLoading) {
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
    final Client client = Client();
    final MovieApi movieApi = MovieApi(
      client,
    );
    _movies.addAll(await movieApi.getMovies(_page));
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
      body: Builder(
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
              final Movie movie = _movies[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/movieDetails', arguments: movie);
                },
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: 8,
                        ),
                        child: Container(
                          alignment: Alignment.topCenter,
                          width: MediaQuery.of(context).size.width / 1.3,
                          height: MediaQuery.of(context).size.height / 1.5,
                          decoration: BoxDecoration(
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                blurRadius: 25,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(movie.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          movie.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          movie.year.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments! as Movie;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 50,
                color: Colors.black26,
                child: Row(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        height: size.height * 0.4,
                        width: size.width * 0.6,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: NetworkImage(movie.largeImage), fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Wrap(
                              children: <Widget>[
                                Text(
                                  movie.year.toString(),
                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.red),
                                ),
                                const Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.red,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Wrap(
                              children: <Widget>[
                                Text(
                                  movie.rating.toString(),
                                  style:
                                      const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.yellow),
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Wrap(
                              children: <Widget>[
                                Text(
                                  movie.runtime.toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                const Icon(
                                  Icons.replay,
                                  color: Colors.blueAccent,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Wrap(
                              children: <Widget>[
                                for (final Torrent torrent in movie.torrents)
                                  Text(
                                    torrent.size,
                                    style:
                                        const TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.w700),
                                  ),
                                for (final Torrent torrent in movie.torrents)
                                  Text(
                                    torrent.quality,
                                    style:
                                        const TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.w700),
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 50,
                color: Colors.black26,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      movie.genres.toString().substring(1).substring(0, movie.genres.toString().length - 2),
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 50,
                color: Colors.black26,
                child: Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 16),
                    child: Text(
                      movie.description,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
