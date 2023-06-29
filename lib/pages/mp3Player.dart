import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
class mp3Player extends StatefulWidget {
  @override
  State<mp3Player> createState() => _mp3PlayerState();
}

class _mp3PlayerState extends State<mp3Player> {
  bool _play = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          SizedBox(height: 50,),
          AudioWidget.assets(
            path: "assets/Audio/sample.mp3",
            play: _play,
            child: MaterialButton(
                child: Text(
                  _play ? "pause" : "play",
                ),
                onPressed: () {
                  setState(() {
                    _play = !_play;
                  });
                }
            ),
            onReadyToPlay: (duration) {
              //onReadyToPlay
            },
            onPositionChanged: (current, duration) {
              //onPositionChanged
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        backgroundColor: Colors.pinkAccent,
        child: Text("Back")
      ),
    );
  }
}