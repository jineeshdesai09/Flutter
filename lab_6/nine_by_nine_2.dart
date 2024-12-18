import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NineByNine2 extends StatelessWidget{
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
                  Expanded(child: Container(decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.black, width: 5)
                  ) ,)),
                  Expanded(child: Container(decoration: BoxDecoration(
                    color: Colors.orange,
                    border: Border.all(color: Colors.black, width: 5)
                  ) ,)),
                  Expanded(child: Container(decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(color: Colors.black, width: 5)
                  ),)),
                ],
              )),
              Expanded(child: Column(
                children: [
                  Expanded(flex: 2,child: Container(color: Colors.pink,)),
                  Expanded(flex: 2,child: Container(color: Colors.green,)),
                  Expanded(child: Container(color: Colors.blueGrey,)),
                ],
              )),
              Expanded(child: Column(
                children: [
                  Expanded(child: Container(color: Colors.red,)),
                  Expanded(flex: 3,child: Container(color: Colors.yellow,)),
                  Expanded(flex: 2, child: Container(color: Colors.purple,)),
                ],
              )
              )
            ]
        )
    );
  }

}