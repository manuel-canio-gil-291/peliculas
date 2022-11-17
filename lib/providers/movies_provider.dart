import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';
import 'package:peliculas/models/popular_response.dart';

class MoviesProvider extends ChangeNotifier {
  
  final String _apiKey = '57b768579acb56e6c5ddb5836c5e31a6';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'en-US';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    print('MoviesProvider inicializado');

    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(
      _baseUrl,
      '3/movie/popular', {
      'api_key' : _apiKey,
      'language' : _language,
      'page' : '1'
      }
    );

    final response = await http.get(url);
    if(response.statusCode != 200) return print('error');
    final nowPlayingResponse = NowPlayingResponse.fromMap(json.decode(response.body));

    final Map<String, dynamic> decodedData = json.decode(response.body);
    
    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(
      _baseUrl,
      '3/movie/now_playing', {
      'api_key' : _apiKey,
      'language' : _language,
      'page' : '1'
      }
    );

    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);

    final Map<String, dynamic> decodedData = json.decode(response.body);
    popularMovies = [...popularMovies, ...popularResponse.results];
    
    onDisplayMovies = popularResponse.results;

    notifyListeners();
  }
}