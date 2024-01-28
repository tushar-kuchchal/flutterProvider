// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/count_provider.dart';
import 'package:flutter_provider/screens/slider_example.dart';
import 'package:provider/provider.dart';

class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  @override
  void initState() {
    super.initState();
    // Implement some initialization operations here.
    
  }

  @override
  Widget build(BuildContext context) {
    // final countProvider = Provider.of<CountProvider>(context, listen: false);
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('Single Porvider '),
         leading: InkWell(
          onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (ctx)=> SliderExample()));
          },
          child: Icon(Icons.send),
        ),
      ),
      floatingActionButton:  Consumer<CountProvider>(builder: (context, value, child) {
        return FloatingActionButton(
        onPressed: () {
          value.setcount();
        },
        child: Icon(Icons.plus_one_sharp),
      );
      },),
      body: Center(child: Consumer<CountProvider>(
        builder: (context, value, child) {
          return Text(
            value.count.toString(),
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Archivo',
                fontWeight: FontWeight.bold,
                color: Colors.blue),
          );
        },
      )),
    );
  }
}
