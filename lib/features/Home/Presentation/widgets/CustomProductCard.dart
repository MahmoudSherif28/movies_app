import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/Home/Data/models/movie_model.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
          },
          child: Container(
            height: 175.h,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    movie.image,
                    height: 175.h,
                    width: MediaQuery.of(context).size.width * 0.4,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    height: 36.h,
                    width: 36.w,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(Icons.bookmark_outline_outlined),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
