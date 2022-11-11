import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  
  final String _apiKey = '57b768579acb56e6c5ddb5836c5e31a6';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'en-US';
  
  MoviesProvider() {
    print('MoviesProvider inicializado');

    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(
      _baseUrl,
      '3/movie/now_playing', {
      'api_key' : _apiKey,
      'language' : _language,
      'page' : '1'
      }
    );

    final response = await http.get(url);
    if(response.statusCode != 200) return print('error');
    final Map<String, dynamic> decodedData = json.decode(response.body);
    print(decodedData['dates']);
  }
}