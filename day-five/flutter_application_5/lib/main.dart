import 'package:flutter/material.dart';
import 'package:flutter_application_5/models/contador_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ContadorModel>(
      create: (context) => ContadorModel(),
      child: MaterialApp(
        title: 'My First App',
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: (){
            },
            child: Consumer<ContadorModel>(builder: (context, contadorModel, _){
              return Text(contadorModel.contador.toString());
            }
            ),
          ),
          body: MyHomePage(),
        ),
      ),
    
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build( BuildContext context ){
    return Column(
      children: [
        Consumer<ContadorModel>(builder: (context, contadorModel, _){
            return Text('Contador: ${contadorModel.contador}');
          },
        ),
        ElevatedButton(
          onPressed: (){
            Provider.of<ContadorModel>(context, listen: false).incrementar();
          }, 
          child: Text('Incrementar')
        )
      ],
    );
  }
}
