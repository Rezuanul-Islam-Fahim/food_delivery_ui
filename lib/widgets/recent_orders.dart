import 'package:flutter/material.dart';

import 'package:food_delivery_ui/data.dart';
import 'package:food_delivery_ui/models/order.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 5),
          child: const Text(
            'Recent Orders',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Container(
          height: 78,
          child: isLandscape
              ? const RecentOrderList(0.6)
              : const RecentOrderList(0.8),
        ),
      ],
    );
  }
}

class RecentOrderList extends StatelessWidget {
  const RecentOrderList(this.containerWidth, {super.key});

  final double containerWidth;

  Widget _buildRecentOrders(BuildContext context, Order order) {
    return Container(
      width: MediaQuery.of(context).size.width * containerWidth,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.grey[300] ?? Colors.grey,
          width: 0.8,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image(
                    width: 75,
                    height: 75,
                    image: AssetImage(order.food.imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          order.food.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.9,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          order.restaurant.name,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.6,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          order.date,
                          style: TextStyle(
                            fontSize: 11,
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
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            margin: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              icon: const Icon(Icons.add_rounded),
              color: Colors.white,
              iconSize: 25,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      scrollDirection: Axis.horizontal,
      itemCount: user.recentOrders.length,
      itemBuilder: (BuildContext context, int index) {
        Order order = user.recentOrders[index];
        return _buildRecentOrders(context, order);
      },
    );
  }
}
