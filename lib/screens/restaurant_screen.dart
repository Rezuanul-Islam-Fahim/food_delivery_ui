import 'package:flutter/material.dart';

import 'package:food_delivery_ui/models/restaurant.dart';
import 'package:food_delivery_ui/models/food.dart';
import 'package:food_delivery_ui/widgets/rating_stars.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen(this.restaurant);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final bool isLandscape = mediaQuery.orientation == Orientation.landscape;
    final double deviceWidth = mediaQuery.size.width;
    final int menuItem = restaurant.foods.length;

    final Widget restaurantDetails = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                restaurant.name,
                style: const TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.9,
                ),
              ),
              Text(
                '${restaurant.distance} miles away',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87.withOpacity(0.7),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          RatingStars(restaurant.rating),
          const SizedBox(height: 5.0),
          Text(
            restaurant.address,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Text(
                    'Reviews',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  splashColor: Colors.white38,
                  onPressed: () {},
                ),
                FlatButton(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Text(
                    'Contact Us',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
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

    Widget _buildMenuItems(Food menuItem) {
      return Container(
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
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(height: 6.0),
                Text(
                  '\$${menuItem.price}',
                  style: const TextStyle(
                    fontSize: 15,
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
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: IconButton(
                  icon: const Icon(Icons.add_rounded),
                  color: Colors.white,
                  padding: const EdgeInsets.all(0),
                  iconSize: 25,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              isLandscape
                  ? HeroImage(restaurant, 0.55)
                  : HeroImage(restaurant, 0.4),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 40.0,
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_rounded),
                      iconSize: 30.0,
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite),
                      iconSize: 35.0,
                      color: Colors.redAccent,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  restaurantDetails,
                  const SizedBox(height: 10.0),
                  const Text(
                    'Our Menus',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Container(
                    height: isLandscape
                        ? (deviceWidth / 2) * (menuItem / 2).ceil() -
                            (deviceWidth / 2.4)
                        : (deviceWidth / 2) * (menuItem / 2).ceil() - 35,
                    padding: EdgeInsets.only(
                      left: isLandscape ? deviceWidth / 8 : 20,
                      right: isLandscape ? deviceWidth / 8 : 20,
                    ),
                    child: GridView.builder(
                      padding: const EdgeInsets.only(top: 5),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: menuItem,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildMenuItems(restaurant.foods[index]);
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeroImage extends StatelessWidget {
  const HeroImage(this.restaurant, this.stackHeight);

  final Restaurant restaurant;
  final double stackHeight;

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
