import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_6/models/user.dart';
import 'package:http/http.dart' as http;

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
          child: UsersScreen(),
        ),
      ),
    );
  }
}




class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UsersScreen>{

  Future<List<User>> fetchAndParseUsers() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);
    if(response.statusCode == 200){
      List<dynamic> jsonList = json.decode(response.body);
      List<User> users = jsonList.map( (user) => User.fromJson(user) ).toList();
      return users;
    }else{
      throw Exception('Fallo al cargar los usuarios');
    }
  } 

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: fetchAndParseUsers(), 
      builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot){

        if(snapshot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator();
        }
        if(snapshot.hasError){
          return Text('Error: ${snapshot.error}');
        }
        if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index){
              final user = snapshot.data![index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
              );
            },
          );
        }
        return Text('');
      });
  }
}
