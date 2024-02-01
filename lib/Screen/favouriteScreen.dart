import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favouriteProvider.dart';
import 'MyFavouriteItem.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> _favouriteList = [];
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Screen"),
       centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyFavouriteItem()),
              );

            },
          )
        ]
      ),
      body:Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 1000,
              itemBuilder: (BuildContext context, int index) { // Add the context parameter
                return Consumer(builder: (context, FavouriteProvider favouriteProvider, child) {
                  return ListTile(
                    title: Text("Item $index"),
                    trailing: IconButton(
                      icon: Icon(favouriteProvider.favouriteList.contains(index) ? Icons.favorite : Icons.favorite_border),
                      onPressed: () {
                        if(favouriteProvider.favouriteList.contains(index)){
                          favouriteProvider.removeFavourite(index);
                        }else{
                          favouriteProvider.addFavourite(index);
                        }
                      },
                    ),
                  );
                },
                );},
            ),
          ),
        ],
      )

    );
  }
}
