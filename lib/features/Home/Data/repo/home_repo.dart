import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/features/Home/Data/models/list_movi_model.dart';
import 'package:movies/features/Home/Data/models/movie_model.dart';

class HomeRepo {
  static Future<List<MovieModel>> getMovies() async {
    try {
      const endpoint =
          "https://moviesverse1.p.rapidapi.com/most-popular-movies";
      final Map<String, String> headers = {
        'X-RapidAPI-Key': 'cf815711f2msh774f04809a4efcfp1205a5jsn08c32ff65e65',
        'X-RapidAPI-Host': 'moviesverse1.p.rapidapi.com',
      };
      final response = await http.get(Uri.parse(endpoint), headers: headers);
      final decodedResponse = jsonDecode(response.body);
      MovieListModel movieListModel = MovieListModel.fromJson(decodedResponse);
      List<MovieModel> tmpMovieList = movieListModel.movieListModel
          .map((e) => MovieModel.fromJson(e))
          .toList();
      return tmpMovieList;
    } catch (e) {
      throw Exception('Failed to get movies! Please try again');
    }
  }
}