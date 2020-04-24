import 'package:flutter/material.dart';

import 'homepage.dart';

// NOTE: If the app gives an error on launch please restart to clear errors

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter Task 3",
      home: Task(),
    );
  }
}

