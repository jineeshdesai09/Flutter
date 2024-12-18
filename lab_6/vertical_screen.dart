import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Vertical extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vertical Screen',
          style: TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(child: Container(color: Colors.red,)),
          Expanded(child: Container(color: Colors.yellow,)),
          Expanded(child: Container(color: Colors.green,)),
        ],
      ),
    );
  }

}