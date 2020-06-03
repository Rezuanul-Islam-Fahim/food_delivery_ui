import 'package:flutter/material.dart';
import 'package:food_delivery_ui/models/food.dart';

class MenuItemsLandscape extends StatelessWidget {
  final Food menuItem;

  MenuItemsLandscape(this.menuItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      height: MediaQuery.of(context).size.width * 0.35,
      margin: EdgeInsets.only(bottom: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: AssetImage(menuItem.imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.black87,
                  Colors.black54,
                  Colors.black54,
                  Colors.black54,
                ],
                stops: [0.2, 0.5, 0.6, 0.8],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                menuItem.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 6.0),
              Text(
                '\$${menuItem.price}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Positioned(
            right: 20.0,
            bottom: 20.0,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                icon: Icon(Icons.add),
                color: Colors.white,
                iconSize: 30.0,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
