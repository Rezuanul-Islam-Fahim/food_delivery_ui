import 'package:flutter/material.dart';
import 'package:food_delivery_ui/data.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  HomeScreen({Key key, this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(left: 64.0),
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          iconSize: 30.0,
          onPressed: () {},
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Cart (${user.cart.length})',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {},
            splashColor: Colors.white30,
          ),
        ],
      ),
    );
  }
}
