import 'dart:convert';
import 'package:movies/features/Home/Data/models/movie_model.dart';
import 'package:http/http.dart' as http;

class HomeRepo {
  Future<List<MovieModel>> trailer(int id) async {
    final headers = {
      'X-RapidAPI-Key': 'e99df4a5d7msh767c16352eae10ap103d12jsn10f8b235b0b6',
      'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com'
    };
    final response = await http.get(
        Uri.parse('https://imdb-top-100-movies.p.rapidapi.com/$id'),
        headers: headers);
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
