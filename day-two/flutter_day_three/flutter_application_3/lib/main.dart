import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              StaticWidgetExample(texto: "Mi primera publicación en Flutter"),
              LikeButton(),
              Counter()
            ],
          ),
        ),
      ),
    );
  }
}

class StaticWidgetExample extends StatelessWidget {

  final String texto;

  const StaticWidgetExample({super.key, required this.texto});

  @override
  Widget build(BuildContext context){
    return Text(texto);
  }
}

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});
  @override
  State<LikeButton> createState() => _LikeButtonState();
}
class _LikeButtonState extends State<LikeButton>{

  int _likesContador = 0;

  void setLike (){
    setState(() {
      _likesContador++;
    });
  }

  @override
  Widget build (BuildContext context){
    return Column(
      children: [
        Text("$_likesContador likes"),
        IconButton(
          onPressed: (){
            setLike();
          }, 
          icon: const Icon(Icons.thumb_up))
      ],
    );
  }
}

class Counter extends StatefulWidget{
  const Counter({super.key});
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter>{

  final oneSecond = Duration(seconds: 1);
  int _seconds = 0;
  void startCount(){
    Timer.periodic(oneSecond, (Timer timer){
      setState(() {
        _seconds++;
      });
      if(_seconds >= 5){
        timer.cancel();
      }
    });
  }
  void restartCount(){
    setState(() {
      _seconds = 0;
    });
  }

  @override
  Widget build( BuildContext context){
    return Column(
      children: [
        Text('hay $_seconds segundos'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: startCount, 
              icon: Icon(Icons.play_arrow)
            ),
            IconButton(
              onPressed: restartCount, 
              icon: Icon(Icons.restart_alt)
            )
          ],          
        ),
      ],
    );
  }
}