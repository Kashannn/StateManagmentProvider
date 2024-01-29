import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/countprovider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

 class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    // TODO: implement initState
    final countProvider = Provider.of<CountProvider>(context, listen: false);

  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print('CountExample build');
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Count Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CountProvider>(
              builder: (context, value, child) {
                return Text(
                  value.count.toString(),
                  style: TextStyle(fontSize: 30),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
