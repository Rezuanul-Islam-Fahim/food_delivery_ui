import 'package:food_delivery_ui/models/food.dart';
import 'package:food_delivery_ui/models/restaurant.dart';
import 'package:food_delivery_ui/models/order.dart';
import 'package:food_delivery_ui/models/user.dart';

final Food _steak = Food(
  imgUrl: 'assets/images/steak.jpg',
  name: 'Steak',
  price: 12.65,
);

final Food _salmon = Food(
  imgUrl: 'assets/images/salmon.jpg',
  name: 'Salmon',
  price: 15.89,
);

final Food _burger = Food(
  imgUrl: 'assets/images/burger.jpg',
  name: 'Burger',
  price: 19.23,
);

final Food _burrito = Food(
  imgUrl: 'assets/images/burrito.jpg',
  name: 'Burrito',
  price: 20.43,
);

final Food _pancake = Food(
  imgUrl: 'assets/images/pancakes.jpg',
  name: 'Pancake',
  price: 24.56,
);

final Food _pasta = Food(
  name: 'Pasta',
  imgUrl: 'assets/images/pasta.jpg',
  price: 10.77,
);

final Food _pizza = Food(
  name: 'Pizza',
  imgUrl: 'assets/images/pizza.jpg',
  price: 15.77,
);

final Food _ramen = Food(
  name: 'Ramen',
  imgUrl: 'assets/images/ramen.jpg',
  price: 8.27,
);

final Restaurant _restaurant0 = Restaurant(
  imgUrl: 'assets/images/restaurant0.jpg',
  name: 'Dhanshiri',
  rating: 5,
  address: '343, Ishakha Road, Rothkhola',
  distance: 1.3,
  foods: <Food>[
    _ramen,
    _steak,
    _burger,
    _burrito,
    _pancake,
    _salmon,
    _pizza,
    _pasta,
  ],
);

final Restaurant _restaurant1 = Restaurant(
  imgUrl: 'assets/images/restaurant1.jpg',
  name: 'Kutumbari',
  rating: 4,
  address: '303, Kali Bari, Akhrabazar',
  distance: 1.1,
  foods: <Food>[
    _pizza,
    _burger,
    _burrito,
    _pancake,
    _salmon,
    _steak,
    _ramen,
    _pasta,
  ],
);

final Restaurant _restaurant2 = Restaurant(
  imgUrl: 'assets/images/restaurant2.jpg',
  name: 'Ishti Kutum',
  rating: 3,
  address: '104, Gourango Bazar',
  distance: 1.6,
  foods: <Food>[
    _pancake,
    _salmon,
    _ramen,
    _pasta,
    _pizza,
    _steak,
    _burger,
    _burrito,
  ],
);

final Restaurant _restaurant3 = Restaurant(
  imgUrl: 'assets/images/restaurant3.jpg',
  name: 'Gangchil',
  rating: 2,
  address: '983, Ishakha Road, Rothkhola',
  distance: 1.8,
  foods: <Food>[
    _pancake,
    _salmon,
    _pizza,
    _pasta,
    _ramen,
    _steak,
    _burger,
    _burrito,
  ],
);

final Restaurant _restaurant4 = Restaurant(
  imgUrl: 'assets/images/restaurant4.jpg',
  name: 'Mak Taste Shop',
  rating: 5,
  address: '343, Hossainpur Road, Nogua',
  distance: 0.8,
  foods: <Food>[
    _burrito,
    _ramen,
    _steak,
    _burger,
    _pancake,
    _salmon,
    _pizza,
    _pasta,
  ],
);

final List<Restaurant> restaurants = <Restaurant>[
  _restaurant0,
  _restaurant1,
  _restaurant2,
  _restaurant3,
  _restaurant4,
];

final User user = User(
  name: 'Rezuanul Islam Fahim',
  recentOrders: <Order>[
    Order(
      food: _steak,
      restaurant: _restaurant4,
      date: '12 May, 2020',
    ),
    Order(
      food: _pasta,
      restaurant: _restaurant0,
      date: '10 May, 2020',
    ),
    Order(
      food: _pancake,
      restaurant: _restaurant2,
      date: '09 May, 2020',
    ),
    Order(
      food: _burger,
      restaurant: _restaurant1,
      date: '08 May, 2020',
    ),
    Order(
      food: _burrito,
      restaurant: _restaurant3,
      date: '08 May, 2020',
    ),
  ],
  cart: <Order>[
    Order(
      food: _pancake,
      restaurant: _restaurant2,
      date: '24 May, 2020',
    ),
    Order(
      food: _burger,
      restaurant: _restaurant1,
      date: '20 May, 2020',
    ),
    Order(
      food: _burrito,
      restaurant: _restaurant3,
      date: '18 May, 2020',
    ),
    Order(
      food: _steak,
      restaurant: _restaurant4,
      date: '12 May, 2020',
    ),
    Order(
      food: _pasta,
      restaurant: _restaurant0,
      date: '10 May, 2020',
    ),
    Order(
      food: _salmon,
      restaurant: _restaurant1,
      date: '10 May, 2020',
    ),
  ],
);
