import 'package:flutter/material.dart';

import 'package:food_delivery_ui/screens/home_screen.dart';

void main() => runApp(const FoodDelivery());

class FoodDelivery extends StatelessWidget {
  const FoodDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        scaffoldBackgroundColor: Colors.grey[200],
        appBarTheme: AppBarTheme(
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          backgroundColor: Colors.lightGreen,
          foregroundColor: Colors.white,
        ),
      ),
      home: HomeScreen(title: 'Food Delivery'),
    );
  }
}
