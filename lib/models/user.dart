import 'package:food_delivery_ui/models/order.dart';

class User {
  const User({
    required this.name,
    required this.recentOrders,
    required this.cart,
  });

  final String name;
  final List<Order> recentOrders;
  final List<Order> cart;
}
