// ignore_for_file: prefer_final_fields

import 'package:flutter/foundation.dart';

class FavoriteItemsProvider with ChangeNotifier{
   List<String> _favoriteItems=[];

  List<String> get favoriteList => _favoriteItems;

  void setFavorite(String item){
    _favoriteItems.add(item);
    notifyListeners();
  } 
  void removeFavorite(String item){
    _favoriteItems.remove(item);
    notifyListeners();
  }

}