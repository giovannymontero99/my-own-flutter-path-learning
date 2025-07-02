
import 'package:flutter/material.dart';
import 'package:flutter_application_5/models/contador_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        children: [
          Consumer<ContadorModel>(
            builder: (context, contadorModel, _){
              return Text('El contador es: ${contadorModel.contador}');
            } 
          ),
          ElevatedButton(
            onPressed: (){
              Provider.of<ContadorModel>(context, listen: false).incrementar();
            }, 
            child: const Text("Incrementar")
          )
        ],
      ),
    );
  }

}