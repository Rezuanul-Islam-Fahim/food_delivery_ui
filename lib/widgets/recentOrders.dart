import 'package:flutter/material.dart';
import 'package:food_delivery_ui/data.dart';
import 'package:food_delivery_ui/models/order.dart';

class RecentOrders extends StatelessWidget {
  _buildRecentOrders(BuildContext context, Order order) {
    return Container(
      width: 315,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(45.0),
        border: Border.all(
          color: Colors.grey[300],
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
                  borderRadius: BorderRadius.circular(45.0),
                  child: Image(
                    width: 100.0,
                    height: 100.0,
                    image: AssetImage(order.food.imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          order.food.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          order.restaurant.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          order.date,
                          style: TextStyle(
                            fontSize: 16,
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
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            margin: EdgeInsets.only(right: 15.0),
            child: IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              iconSize: 30.0,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20, bottom: 10.0),
          child: Text(
            'Recent Orders',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.1,
            ),
          ),
        ),
        Container(
          height: 100.0,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemCount: user.recentOrders.length,
            itemBuilder: (BuildContext context, int index) {
              Order order = user.recentOrders[index];
              return _buildRecentOrders(context, order);
            },
          ),
        ),
      ],
    );
  }
}
