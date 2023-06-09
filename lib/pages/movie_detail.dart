import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    // String path;
    if (movie.posterPath != null) {
      imgPath = imgPath + movie.posterPath;
    } else {
      imgPath =
          "https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg";
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title,
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                height: height / 1.5,
                child: Image.network(imgPath),
              ),
              Container(
                child: Text(movie.overview),
                padding: EdgeInsets.only(left: 16, right: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
