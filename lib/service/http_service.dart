import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/movie.dart';

class HttpService {
  final String apiKey = '1ebcbf79474783db8954cf6e13ecbf54';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List?> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final movieMap = jsonResponse['results'];
      print(jsonResponse);
      List movies = movieMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Failed");
      return null;
    }
  }
}
