import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class NineByNine extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Whole Screen',
          style: TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Row(
        children: [
          Expanded(child: Column(
          children: [
            Expanded(child: Container(color: Colors.red,)),
            Expanded(child: Container(color: Colors.brown,)),
            Expanded(child: Container(color: Colors.black,)),
        ],
      )),
          Expanded(child: Column(
          children: [
            Expanded(child: Container(color: Colors.greenAccent,)),
            Expanded(child: Container(color: Colors.grey,)),
            Expanded(child: Container(color: Colors.redAccent,)),
    ],
    )),
          Expanded(child: Column(
          children: [
            Expanded(child: Container(color: Colors.blue,)),
            Expanded(child: Container(color: Colors.purple,)),
            Expanded(child: Container(color: Colors.orange,)),
    ],
    ))]));
  }

}
