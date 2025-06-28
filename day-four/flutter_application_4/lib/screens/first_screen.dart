import 'package:flutter/material.dart';
import 'package:flutter_application_4/screens/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Primera pantalla'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed:(){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=> SecondScreen() )
            );
          }, 
          child: const Text('Second screen')),
      ),
    );
  }
}