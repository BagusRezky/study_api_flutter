import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:study_api_flutter/models/movie.dart';

class HttpService {
  final String apiKey = '2338adb348c434c1285c29e7c13f360b';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List?> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = jsonDecode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }
}
