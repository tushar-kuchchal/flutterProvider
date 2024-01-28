// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/favorite/favorite_provider.dart';
import 'package:provider/provider.dart';

class SelectedFavoriteItems extends StatelessWidget {
  const SelectedFavoriteItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Items'),
      ),
      body: Column(
        children: [
          Expanded(child: Consumer<FavoriteItemsProvider>(
            builder: (context, value, child) {
              return value.favoriteList.isNotEmpty ?
              ListView.builder(
                itemCount: value.favoriteList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      value.removeFavorite(value.favoriteList[index]);
                    },
                    title: Text(value.favoriteList[index]),
                    trailing: Icon(Icons.favorite),
                  );
                },
              ) : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: Icon(Icons.hourglass_empty,size: 100,color: Colors.purple,)),
                  SizedBox(height: 30,),
                  Text('Your Favorite List is Empty', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.purple),)
                ],
              );
            },
          ))
        ],
      ),
    );
  }
}
