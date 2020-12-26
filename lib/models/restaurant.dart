import 'package:flutter/foundation.dart';
import 'package:food_delivery_ui/models/food.dart';

class Restaurant {
  const Restaurant({
    @required this.imgUrl,
    @required this.name,
    @required this.rating,
    @required this.address,
    @required this.distance,
    @required this.foods,
  });

  final String imgUrl;
  final String name;
  final int rating;
  final String address;
  final double distance;
  final List<Food> foods;
}
