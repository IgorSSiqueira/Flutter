//@dart=2.9

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    /*_controller = VideoPlayerController.network(
        'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4')
      ..initialize().then((_) {
        //ESTE SETSTATE VAZIO ESTÁ APENAS PARA DEIXAR O VÍDEO FUNCIONAL
        //CASO QUEIRA, PODE COLOCAR ALGO MOSTRANDO QUE O VÍDEO FOI CARREGADO
        setState(() {
          _controller.play();
        });
      });*/

    _controller = VideoPlayerController.asset('videos/exemplo.mp4')
      ..setLooping(false)
      ..initialize().then((_) {
        setState(() {
          //_controller.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const Text('Pressione Play'),
      ),
      floatingActionButton: FloatingActionButton(
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
      ),
    );
  }
}
