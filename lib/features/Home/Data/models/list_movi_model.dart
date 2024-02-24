class MovieListModel {
  late final List<dynamic> movieListModel;

  MovieListModel({required this.movieListModel});

  factory MovieListModel.fromJson(Map<String, dynamic> json) {
    return MovieListModel(movieListModel: json['movies']);
  }
}
