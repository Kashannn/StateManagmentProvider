import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({Key? key}) : super(key: key);

  // Declare the ValueNotifier
  ValueNotifier<int> valueNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    print("Notify Listener Screen");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notify Listener"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: valueNotifier,
              builder: (BuildContext context, int value, Widget? child) {
                return Text(
                  "Value: $value",
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),

            FloatingActionButton(
              onPressed: () {
                valueNotifier.value++;
                print(valueNotifier.value);
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
