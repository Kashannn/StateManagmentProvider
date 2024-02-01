import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier{

  List<int> _favouriteList = [];
  List<int> get favouriteList => _favouriteList;


 void addFavourite(int index){
   _favouriteList.add(index);
   notifyListeners();
 }
 void removeFavourite
  (int index){
    _favouriteList.remove(index);
    notifyListeners();
  }
}