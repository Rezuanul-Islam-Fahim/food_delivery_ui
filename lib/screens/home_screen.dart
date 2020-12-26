import 'package:flutter/material.dart';

import 'package:food_delivery_ui/data.dart';
import 'package:food_delivery_ui/screens/restaurant_screen.dart';
import 'package:food_delivery_ui/screens/cart_screen.dart';
import 'package:food_delivery_ui/widgets/recent_orders.dart';
import 'package:food_delivery_ui/widgets/rating_stars.dart';
import 'package:food_delivery_ui/models/restaurant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({this.title, Key key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    Widget _buildRestaurants() {
      List<Widget> restaurantList = [];

      restaurants.forEach((Restaurant restaurant) {
        restaurantList.add(
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RestaurantScreen(restaurant),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: Colors.grey[300],
                  width: 0.8,
                ),
              ),
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Hero(
                      tag: restaurant.name,
                      child: Image(
                        image: AssetImage(restaurant.imgUrl),
                        width: 105,
                        height: 105,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            restaurant.name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.9,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          RatingStars(restaurant.rating),
                          const SizedBox(height: 6),
                          Text(
                            restaurant.address,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${restaurant.distance} miles away',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });

      return Column(children: restaurantList);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.account_circle),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {},
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Cart (${user.cart.length})',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CartScreen(),
              ),
            ),
            splashColor: Colors.white24,
            highlightColor: Colors.white12,
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 80,
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 0.8,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1.2,
                  ),
                ),
                prefixIcon: const Icon(Icons.search, size: 22),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  iconSize: 18,
                  onPressed: () {},
                ),
                hintText: 'Search Food or Restaurant',
                hintStyle: const TextStyle(fontSize: 14),
              ),
            ),
          ),
          RecentOrders(),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: const Text(
              'Restaurants',
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
              left: 15,
              bottom: 10,
            ),
            child: _buildRestaurants(),
          ),
        ],
      ),
    );
  }
}
