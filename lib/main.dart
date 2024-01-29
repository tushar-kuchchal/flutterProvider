// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/count_provider.dart';
import 'package:flutter_provider/provider/favorite/favorite_provider.dart';
import 'package:flutter_provider/provider/slider_provider.dart';
import 'package:flutter_provider/provider/theme_provider.dart';
import 'package:flutter_provider/screens/counter_example.dart';
import 'package:flutter_provider/screens/favourite/favorite_items.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SliderProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavoriteItemsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeChangeProvider(),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themePorvider = Provider.of<ThemeChangeProvider>(context);
          return MaterialApp(
              themeMode: themePorvider.themeMode,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  brightness: Brightness.light,
                  appBarTheme: const AppBarTheme(
                    color: Colors.amber,
                  ),
                  iconTheme: IconThemeData(color: Colors.purpleAccent)),
              darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.purple,
                  appBarTheme: AppBarTheme(color: Colors.teal),
                  iconTheme: IconThemeData(color: Colors.tealAccent[100])),
              home: Favoriteitems());
        },
      ),
    );
  }
}
