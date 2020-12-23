import 'package:flutter/material.dart';
import 'package:food_delivery_ui/models/restaurant.dart';
import 'package:food_delivery_ui/models/food.dart';
import 'package:food_delivery_ui/widgets/rating_stars.dart';
import 'package:food_delivery_ui/widgets/menu_items_landscape.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantScreen(this.restaurant);

  @override
  State<StatefulWidget> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  _buildMenuItems(Food menuItem) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
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
                  letterSpacing: 1.1,
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
            right: 10.0,
            bottom: 10.0,
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

  _buildRestaurantItems(List<Food> foods, bool isLandscape) {
    final List<Widget> restaurantItemList = [];

    for (int i = 0; i < foods.length; i += 2) {
      restaurantItemList.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MenuItemsLandscape(foods[i]),
            MenuItemsLandscape(foods[i + 1]),
          ],
        ),
      );
    }

    return Column(children: restaurantItemList);
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final double stackHeightLandscape = 0.65;
    final double stackHeightPortrait = 0.4;

    final Widget restaurantDetails = Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.restaurant.name,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.9,
                ),
              ),
              Text(
                '${widget.restaurant.distance} miles away',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.0),
          RatingStars(widget.restaurant.rating),
          SizedBox(height: 5.0),
          Text(
            widget.restaurant.address,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Reviews',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  splashColor: Colors.white38,
                  onPressed: () {},
                ),
                FlatButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Contact Us',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  splashColor: Colors.white38,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              isLandscape
                  ? HeroImage(widget.restaurant, stackHeightLandscape)
                  : HeroImage(widget.restaurant, stackHeightPortrait),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 30.0,
                  horizontal: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      iconSize: 30.0,
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      iconSize: 35.0,
                      color: Colors.redAccent,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          isLandscape
              ? Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(0),
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      restaurantDetails,
                      Text(
                        'Our Menus',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.0),
                      _buildRestaurantItems(
                        widget.restaurant.foods,
                        isLandscape,
                      ),
                    ],
                  ),
                )
              : Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      restaurantDetails,
                      Text(
                        'Our Menus',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(height: 2.0),
                    ],
                  ),
                ),
          if (!isLandscape)
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.only(left: 10, right: 10, top: 8.0),
                crossAxisCount: 2,
                children: List.generate(
                  widget.restaurant.foods.length,
                  (int index) {
                    return _buildMenuItems(widget.restaurant.foods[index]);
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class HeroImage extends StatelessWidget {
  final Restaurant restaurant;
  final double stackHeight;

  HeroImage(this.restaurant, this.stackHeight);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: restaurant.name,
      child: Image(
        image: AssetImage(restaurant.imgUrl),
        height: MediaQuery.of(context).size.height * stackHeight - 50.0,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
    );
  }
}
