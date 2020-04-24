import 'package:flutter/material.dart';

import 'homepage.dart';

class Details extends StatelessWidget {
  final User user;

  Details(this.user);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name)
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Image.asset("asset/download.png"),
            Text(user.name, style: TextStyle(fontSize :30.0, fontWeight: FontWeight.bold, )
            ),
            Text(user.username, style: TextStyle(fontSize :20.0, fontStyle: FontStyle.italic, )),
            Text(user.email, style: TextStyle(fontSize :15.0),),
            Text(user.phone.toString(), style: TextStyle(fontSize :15.0),)
            ],
      ),
    );
  }
}