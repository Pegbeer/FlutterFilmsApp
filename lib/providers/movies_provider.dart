import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:films_application/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '68b3538d41d9c3993e7538e0f6cbcdd5';
  String _language = 'en-UK';
  List<Movie> displayMovies = [];
  List<Movie> popularMovies = [];

  int _popularPage = 1;

  MoviesProvider() {
    _getMoviesByLink('3/movie/now_playing', _DataType.nowPlaying);
    _getMoviesByLink('3/movie/popular', _DataType.popular);
  }

  void _getMoviesByLink(String url, _DataType dataType) async {
    var uri = Uri.https(_baseUrl, url,
        {'api_key': _apiKey, 'language': _language, 'page': '$_popularPage'});
    final response = await http.get(uri);

    switch (dataType) {
      case _DataType.nowPlaying:
        {
          final result = NowPlayingResponse.fromJson(response.body);
          displayMovies = result.results;
        }
        break;

      case _DataType.popular:
        {
          _popularPage += 1;
          final result = PopularResponse.fromJson(response.body);
          popularMovies = [...popularMovies, ...result.results];
        }
    }
    notifyListeners();
  }
}

enum _DataType { nowPlaying, popular }
