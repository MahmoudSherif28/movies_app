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
            FutureBuilder<List<SQLModel>>(
                future: SQLProvider.instance.getAllMovies(),
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
                    favouritemovies = snapshot.data!;
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Image.network(favouritemovies[index].image),
                            ],
                          );
                        },
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
          ],
        ),
      ),
    );
  }
}
