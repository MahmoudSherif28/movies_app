import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/features/Home/Data/models/movie_model_details.dart';

class detailsrepo {
  Future<MovieModelDetails> trailer(String id) async {
    final headers = {
      'X-RapidAPI-Key': 'e03a824990msh9ce142b7002cf69p1387a4jsn2f458a843750',
      'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com'
    };
    final response = await http.get(
        Uri.parse('https://imdb-top-100-movies.p.rapidapi.com/$id'),
        headers: headers);
    if (response.statusCode <= 299 && response.statusCode >= 200) {
      final decodedResponse = jsonDecode(response.body);
      MovieModelDetails movieModelDetails =
          MovieModelDetails.fromJson(decodedResponse);
      print(response.statusCode);
      return movieModelDetails;
    } else {
      print(response.statusCode);
      throw ("RequestFailure${response.body}");
    }
  }
}
