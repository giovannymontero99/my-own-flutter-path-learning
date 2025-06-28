import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segunda pantalla"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: const Text("back to the first screen")),
      ),
    );
  }
}