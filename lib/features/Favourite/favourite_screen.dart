import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/database/fav_database_model.dart';
import 'package:movies/database/fav_database.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<SQLModel> favouritemovies = [];

  @override
  build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111111),
      body: SafeArea(
        child: FutureBuilder<List<Map>>(
            future: SqfliteDb().getData(),
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
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                            width: 120.w,
                            height: 200.h,
                            child:
                            Image.network(snapshot.data![index]["image"])),
                        SizedBox(
                          width: 10.w,
                        ),
                        Row(
                          children: [
                            Text(
                              snapshot.data![index]["title"],
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 14.sp),
                            ),
                            IconButton(
                              onPressed: () {
                                SqfliteDb().deleteData(
                                  id: snapshot.data![index]["id"],
                                );
                              },
                              icon: Icon(
                                Icons.delete_forever,
                                color: Color(0xff937900),
                                size: 26.sp,
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                );
              }
              print(snapshot.data![0]["image"]);
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
