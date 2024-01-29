import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/ExampleOneProvider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({Key? key}) : super(key: key);

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {

  @override
  Widget build(BuildContext context) {

    print('ExampleOne build');
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Consumer<ExampleOneProvider>(
              builder: (context, value, child) {
                double sliderValue = value.value; // Store the value in a variable
                return Slider(
                  value: sliderValue,
                  onChanged: (val) {
                    value.setValue(val);
                  },
                );
              },
            ),
          ),

          Consumer<ExampleOneProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red.withOpacity(value.value),
                      ),
                      child: Text('Hello'),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red.withOpacity(value.value),
                      ),
                      child: Text('Hello'),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
