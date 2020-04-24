import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:task3/details.dart';

class Task extends StatefulWidget {
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {

  Future<List<User>>_getUsers() async {

    var data = await http.get("https://jsonplaceholder.typicode.com/users");

    var jsonData = json.decode(data.body);

    List<User> users = [];

    for (var u in jsonData){
      User user = User(u["id"],u["phone"],u["name"],u["username"],u["email"],u["catchPhrase"],);
      users.add(user);
    }
    print(users.length);

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter from Json 1'),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getUsers(), 
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.data == null){
              return Container(
                child: Center(child: Text('Loading...')
                ),
              );
            }else{
            return ListView.builder(
              itemCount: snapshot.data.length, 
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(backgroundImage: AssetImage("asset/download.png"),
                  ),
                  title: Text(snapshot.data[index].name),
                  subtitle: Text(snapshot.data[index].email),
                  onTap: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => Details(snapshot.data[index])
                    ),
                    );
                  },
                );
              },
            );
            }
          },
        )
      ),
    );
  }
}

class User{
  final int id;
  final int phone;
  final String name;
  final String username;
  final String email;
  final String catchPhrase;

  User(this.id, this.phone, this.name,this.username, this.email,this.catchPhrase);
  
}

