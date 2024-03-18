import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/database/fav_database_model.dart';
import 'package:movies/database/fav_database.dart';
import 'package:movies/features/Trailler/trailer.dart';

class moviedetails extends StatefulWidget {
  const moviedetails(
      {super.key,
      required this.id,
      required this.image,
      required this.title,
      required this.rating,
      required this.description});

  final String id;
  final String image;
  final String title;
  final String rating;
  final String description;

  @override
  State<moviedetails> createState() => _moviedetailsState();
}

class _moviedetailsState extends State<moviedetails> {
  bool press = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111111),
      appBar: AppBar(
        backgroundColor: Color(0xff111111),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "DETAILS",
          style: TextStyle(color: Color(0xff937900)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.all(10),
              height: 400.h,
              width: MediaQuery.sizeOf(context).width,
              child: Image.network(
                widget.image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(color: Color(0xff937900), fontSize: 25.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.rating,
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xff937900),
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xff937900),
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xff937900),
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xff937900),
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xff937900),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    widget.description,
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              press = !press;
                            });
                          },
                          icon: (Icon(
                            Icons.favorite,
                            size: 40,
                            color: press ? Colors.grey : Colors.red,
                          ))),
                      SizedBox(
                        width: 90.w,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          SqfliteDb().insertData(
                              id: widget.id,
                              title: widget.title,
                              image: widget.image);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => movietrailer(
                                      id: widget.id,
                                    )),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white60,
                          backgroundColor: Color(0xff937900),
                          // Text color of the button
                          minimumSize: Size(200, 50),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "WATCH TRAILER",
                              style: (TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Icon(
                              Icons.slow_motion_video_sharp,
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
