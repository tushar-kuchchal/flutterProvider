// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/favorite/favorite_provider.dart';
import 'package:flutter_provider/screens/favourite/selected_favorite_items.dart';
import 'package:provider/provider.dart';

class Favoriteitems extends StatefulWidget {
  const Favoriteitems({super.key});

  @override
  State<Favoriteitems> createState() => _FavoriteitemsState();
}

class _FavoriteitemsState extends State<Favoriteitems> {
  @override
  void initState() {
    super.initState();
    // Implement some initialization operations here.
  }

  @override
  Widget build(BuildContext context) {
    print('favorite build is called');

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite List'),
      ),
      floatingActionButton: Consumer<FavoriteItemsProvider>(
        builder: (context, value, child) {
          return FloatingActionButton(
            child: Text(value.favoriteList.length.toString()),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => SelectedFavoriteItems()));
            },
          );
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<FavoriteItemsProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          if (value.favoriteList.contains('Item$index')) {
                            value.removeFavorite('Item$index');
                          } else {
                            value.setFavorite('Item$index');
                          }
                        },
                        title: Text('Item $index'),
                        trailing: Icon(value.favoriteList.contains('Item$index')
                            ? Icons.favorite
                            : Icons.favorite_border_outlined),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
