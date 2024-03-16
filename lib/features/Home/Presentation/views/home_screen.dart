import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/CustomMovieCard.dart';
import 'package:movies/features/Home/Data/repo/home_repo.dart';
import 'package:movies/features/search/search.dart';

class homescreen extends StatelessWidget {
  homescreen({super.key});

  @override
  final ScrollController scrollController = ScrollController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111111),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Discover",
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w900),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) => SearchPage()));
                        },
                        icon: Icon(
                          Icons.search_outlined,
                          color: Color(0xff937900),
                          size: 45.sp,
                        )),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                FutureBuilder(
                  future: HomeRepo().getMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          "Error ${snapshot.error}",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                    if (snapshot.hasData) {
                      return GridView.builder(
                          shrinkWrap: true,
                          controller: scrollController,
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio:
                              (MediaQuery
                                  .of(context)
                                  .size
                                  .width *
                                  0.4) /
                                  260,
                              crossAxisCount: 2),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return CustomMovieCard(
                                movieModel: snapshot.data![index]
                            );
                          });
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

