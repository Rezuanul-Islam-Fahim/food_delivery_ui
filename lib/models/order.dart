import 'package:food_delivery_ui/models/food.dart';
import 'package:food_delivery_ui/models/restaurant.dart';

class Order {
  const Order({
    required this.food,
    required this.date,
    required this.restaurant,
    required this.quantity,
  });

  final Food food;
  final Restaurant restaurant;
  final String date;
  final int quantity;
}
