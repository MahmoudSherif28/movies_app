import 'package:flutter/material.dart';
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
        child: Column(
          children: [
            FutureBuilder<List<Map>>(
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
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Image.network(snapshot.data![index]["image"]),

                            ],
                          );
                        },
                      ),
                    );
                  }
                  print(snapshot.data![0]["image"]);
                  return const Center(child: CircularProgressIndicator());
                }),
          ],
        ),
      ),
    );
  }
}
