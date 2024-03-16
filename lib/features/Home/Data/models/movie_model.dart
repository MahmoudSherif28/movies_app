import 'dart:convert';

class MovieModel {
  late int rank;
  late String title;
  late String description;
  late String image;
  late String big_image;
  late String rating;
  late String id;
  late int year;

  MovieModel({
    required this.rank,
    required this.title,
    required this.description,
    required this.image,
    required this.big_image,
    required this.rating,
    required this.id,
    required this.year,
  });

  MovieModel.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    big_image=json['big_image'];
    rating=json['rating'];
    id=json['id'];
    }

  Map<String, dynamic> toJson() {
    return {
      'rank': rank,
      'title': title,
      'description':description ,
      'image': image,
      'big_image': big_image,
      'rating': rating,
      'id':id,
      'year':year,
    };
  }
}
