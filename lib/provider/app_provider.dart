import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quadb_tech/model/movie_detail_model.dart';
import 'package:quadb_tech/model/previous_episode_model.dart';

class AppProvider extends ChangeNotifier {

  int _currentScreen = 0;
  int get currentScreen => _currentScreen;
  void setCurrentScreen(int value) {
    if (value == 1) {
      searchedMovies = [];
    }
    _currentScreen = value;
    notifyListeners();
  }

  bool _fetching = true;
  bool get fetching => _fetching;
  void setFetching(bool value) {
    _fetching = value;
    notifyListeners();
  }

  bool _fetchingEpisode = true;
  bool get fetchingEpisode => _fetchingEpisode;
  void setFetchingEpisode(bool value) {
    _fetchingEpisode = value;
    notifyListeners();
  }

  bool _fetchingSearchedMovie = true;
  bool get fetchingSearchedMovie => _fetchingSearchedMovie;
  void setFetchingSearchedMovie(bool value) {
    _fetchingSearchedMovie = value;
    notifyListeners();
  }

  List<MovieDetailModel> movies = [];
  late PreviousEpisodeModel previousEpisode;
  List<MovieDetailModel> searchedMovies = [];

  Future getMovieList() async {
    try {
      final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body.toString());
        movies = data.map((json) => MovieDetailModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load shows');
      }
    } catch (e) {
      throw Exception('Failed to load shows');
    }
    setFetching(false);
  }

  Future getPreviousEpisode(String url) async {
    setFetchingEpisode(true);
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        dynamic data = jsonDecode(response.body.toString());
        previousEpisode = PreviousEpisodeModel.fromJson(data);
      } else {
        throw Exception('Failed to load previous episode');
      }
    } catch (e) {
      throw Exception('Failed to load previous episode');
    }
    setFetchingEpisode(false);
  }

  Future getSearchedMovieList(String name) async {
    setFetchingSearchedMovie(true);
    try {
      final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=$name')).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body.toString());
        searchedMovies = data.map((json) => MovieDetailModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load shows');
      }
    } catch (e) {
      searchedMovies = [];
    }
    setFetchingSearchedMovie(false);
  }
}