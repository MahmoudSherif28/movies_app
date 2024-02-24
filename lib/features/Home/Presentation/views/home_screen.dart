import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/Home/Data/repo/home_repo.dart';
import 'package:movies/features/Home/Presentation/views/home_screen.dart';
import 'package:movies/features/Home/Presentation/widgets/CustomProductCard.dart';

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
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark_outline_outlined,
                          color: Color(0xff937900),
                          size: 40.sp,
                        )),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                FutureBuilder(
                  future: HomeRepo.getMovies(),
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
                                      (MediaQuery.of(context).size.width *
                                              0.4) /
                                          260,
                                  crossAxisCount: 2),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 175.h,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          snapshot.data![index].image,
                                          height: 175.h,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          fit: BoxFit.cover,
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
                                        snapshot.data![index].title,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold ,
                                            color: Colors.white54),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 50,
                                          ),
                                          Text(
                                            snapshot.data![index].rating,
                                            style: TextStyle(
                                                color: Colors.white54,
                                                fontWeight: FontWeight.w900),
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
