import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'movie.dart';

class HttpHelper {
  static String urlKey = 'api_key=93008d931d43531f00341aaaad119fe9';
  static String urlBase = 'https://api.themoviedb.org/3/movie';
  static String urlUpcoming = '/upcoming?';
  static String urlLanguage = '&language=en-US';
  final String urlSearchBase =
      'https://api.themoviedb.org/3/search/movie?api_key=e3fd37e8dd3eca6eecb8808906be73bc&query=';

  Future<List<Movie>?> getUpcoming() async {
    final String upcoming = urlBase + urlUpcoming + urlKey + urlLanguage;
    http.Response result = await http.get(Uri.parse(upcoming));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List<Movie> movies =
          moviesMap.map<Movie>((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }

  Future<List<Movie>?> findMovies(String title) async {
    final String query = urlSearchBase + title;
    http.Response result = await http.get(Uri.parse(query));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List<Movie> movies =
          moviesMap.map<Movie>((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }
}
