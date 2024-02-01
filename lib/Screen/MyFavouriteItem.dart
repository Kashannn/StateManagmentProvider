import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favouriteProvider.dart';

class MyFavouriteItem extends StatefulWidget {
  const MyFavouriteItem({super.key});

  @override
  State<MyFavouriteItem> createState() => _MyFavouriteItemState();
}

class _MyFavouriteItemState extends State<MyFavouriteItem> {

  @override
  Widget build(BuildContext context) {
    final favouriteProvider=Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favourite Item"),
        centerTitle: true,
      ),
        body:Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount:favouriteProvider.favouriteList.length,
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
