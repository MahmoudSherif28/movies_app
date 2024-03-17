import 'package:flutter/material.dart';
import 'package:movies/features/Home/Data/repo/api__details_repo.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class movietrailer extends StatefulWidget {
  const movietrailer({super.key, required this.id});

  final String id;

  @override
  State<movietrailer> createState() => _movietrailerState();
}

class _movietrailerState extends State<movietrailer> {
  late YoutubePlayerController _controller;

  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: "",
        flags: YoutubePlayerFlags(
          mute: true,
        ));
    super.initState();
  }

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
      ),
      body: Center(
        child: FutureBuilder(
          future: detailsrepo().trailer(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Error ${snapshot.error}",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              );
            }
            if (snapshot.hasData) {
              _controller = YoutubePlayerController(
                  initialVideoId: snapshot.data!.trailer_youtube_id,
                  flags: const YoutubePlayerFlags(
                    mute: false,
                    forceHD: true,
                    loop: false,
                    autoPlay: false,
                  ));
              return YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controller,
                ),
                builder: (context, player) {
                  return YoutubePlayer(controller: _controller);
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
