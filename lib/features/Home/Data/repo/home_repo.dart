import 'dart:convert';
import 'package:movies/features/Home/Data/models/movie_model.dart';
import'package:http/http.dart'as http;
class HomeRepo {
  static const String endPoint = "https://imdb-top-100-movies.p.rapidapi.com/";
  Future<List<MovieModel>> getMovies() async {
    final headers = {
      'X-RapidAPI-Key': 'e03a824990msh9ce142b7002cf69p1387a4jsn2f458a843750',
      'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com'
    };
    final response = await http.get(Uri.parse(endPoint), headers: headers);
    if (response.statusCode <= 299 && response.statusCode >= 200) {
      final List<dynamic> decodedResponse = jsonDecode(response.body);
      List<MovieModel> movies =
      decodedResponse.map((item) => MovieModel.fromJson(item)).toList();
      print(response.statusCode);
      return movies;
    } else {
      print(response.statusCode);
      throw ("RequestFailure${response.body}");
    }
  }
}