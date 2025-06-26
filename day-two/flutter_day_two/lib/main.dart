import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First AppTest',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('This is a simple appbar '),
        ),
        body: Center(
          child: 
          Column(
            children: [
              const Text(
                'Hello World',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.w900
                ),
              ),
              Image.asset(
                'lib/assets/images/blackberry.png',
                height: 100,
              ),
              ElevatedButton(
                onPressed: () {}, 
                child: Text('Ejemplo') )
            ],
          )
        ),
      ),
    );
  }
}
