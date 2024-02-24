import 'dart:convert';

class MovieModel {
  final String title;
  final String year;
  final String timeline;
  final String rating;
  final String image;

  MovieModel({
    required this.title,
    required this.year,
    required this.timeline,
    required this.rating,
    required this.image,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      year: json['year'],
      timeline: json['timeline'],
      rating: json['rating'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'year': year,
      'timeline': timeline,
      'rating': rating,
      'image': image,
    };
  }
}
