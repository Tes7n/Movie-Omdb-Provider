import 'package:flutter/material.dart';
import 'package:movie_provider/models/models.dart';
import 'package:movie_provider/services/api_service.dart';

class MovieProvider extends ChangeNotifier {
  bool isLoading = true;
  String test = 'test';
  final List<MovieModel> movieList = <MovieModel>[];

  MovieProvider() {
    fetchMovies("truth");
    print('provider instance created.');
  }

  void fetchMovies(String movieName) async {
    try {
      isLoading = true;
      movieList.clear();
      var movie = await ApiService(movieName: movieName).fetchMovies();
      movieList.add(movie);
      notifyListeners();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
