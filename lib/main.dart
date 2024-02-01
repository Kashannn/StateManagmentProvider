import 'package:flutter/material.dart';
import 'package:learnstates/provider/ExampleOneProvider.dart';
import 'package:learnstates/provider/countprovider.dart';
import 'package:learnstates/provider/favouriteProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';


import 'Screen/CountExample.dart';
import 'Screen/ExampleOne.dart';
import 'Screen/favouriteScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FavouriteScreen(),
      ),
    );
  }
}
