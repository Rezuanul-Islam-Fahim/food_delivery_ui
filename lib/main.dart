import 'package:flutter/material.dart';

import 'package:food_delivery_ui/screens/home_screen.dart';

void main() => runApp(FoodDelivery());

class FoodDelivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        scaffoldBackgroundColor: Colors.grey[200],
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
              brightness: Brightness.dark,
            ),
      ),
      home: HomeScreen(title: 'Food Delivery'),
    );
  }
}
