import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class movietrailer extends StatefulWidget {
  const movietrailer({super.key});

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
        child: Consumer(builder: (context, watch, _) {
          return Container(
            child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _controller,
              ),
              builder: (context, player) {
                return YoutubePlayer(controller: _controller);
              },
            ),
          );
        }),
      ),
    );
  }
}
