import 'package:food_delivery_ui/models/food.dart';
import 'package:food_delivery_ui/models/restaurant.dart';

class Order {
  final Food food;
  final Restaurant restaurant;
  final String date;
  final int quantity;

  Order({
    this.food,
    this.date,
    this.restaurant,
    this.quantity,
  });
}
