import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Álcool ou Gasolina", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[900],
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: () {})
        ],
      ),
    );
  }
}
