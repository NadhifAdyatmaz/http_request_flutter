import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../service/http_service.dart';
import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';
  int? moviesCount;
  late List movies;
  late HttpService service;

  Future initialize() async {
    movies = [];
    movies = (await service.getPopularMovies()) as List;
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies",
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      ),
      body: ListView.builder(
        itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
        itemBuilder: (context, int position) {
          return Card(
            color: Color.fromARGB(255, 204, 231, 152),
            elevation: 6.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(imgPath + movies[position].posterPath),
              ),
              title: Text(movies[position].title),
              subtitle: Text(
                // ignore: prefer_interpolation_to_compose_strings
                'Rating = ' + movies[position].voteAverage.toString(),
              ),
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                    builder: (_) => MovieDetail(movies[position]));
                Navigator.push(context, route);
              },
            ),
          );
        },
      ),
    );
  }
}
