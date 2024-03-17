import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/Details/details.dart';
import 'package:movies/features/Home/Data/models/movie_model.dart';

class CustomMovieCard extends StatelessWidget {
  const CustomMovieCard({
    super.key,
    required this.movieModel,
  });

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 175.h,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => moviedetails(
                              id: movieModel.id,
                              image: movieModel.image,
                              title: movieModel.title,
                              rating: movieModel.rating,
                              description: movieModel.description,
                            )));
                  },
                  child: Image.network(
                    movieModel.image,
                    height: 175.h,
                    width: MediaQuery.of(context).size.width * 0.4,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 4,
                right: 1,
                child: Container(
                  height: 36.h,
                  width: 36.w,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Icon(
                      Icons.bookmark_outline_outlined,
                      color: Colors.white54,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                movieModel.title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white54),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    movieModel.rating,
                    style: TextStyle(
                        color: Colors.white54, fontWeight: FontWeight.w900),
                  ),
                  Icon(
                    Icons.star,
                    color: Color(0xff937900),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
