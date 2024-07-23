import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/models/cart_item.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    // Dal Bhat
    Food(
      name: "Dal Bhat",
      imagePath: "images/dalbhat/dal_bhat.jpg",
      description: "Traditional Nepalese meal with lentils, rice, and vegetable curry.",
      price: 1099.00, // Updated price in NPR
      category: FoodCategory.dalBhat,
    ),

    // Momo
    Food(
      name: "Momo",
      imagePath: "images/momo/momo.jpg",
      description: "Steamed dumplings filled with meat or vegetables, served with spicy sauce.",
      price: 850.00, // Updated price in NPR
      category: FoodCategory.momo,
    ),

    // Curry
    Food(
      name: "Aloo Tama",
      imagePath: "images/curry/aloo_tama.jpg",
      description: "Potato and bamboo shoot curry.",
      price: 550.00, // Updated price in NPR
      category: FoodCategory.curry,
    ),
    Food(
      name: "Saag",
      imagePath: "images/curry/saag.jpg",
      description: "Creamy spinach dish, often served with flatbread.",
      price: 600.00, // Updated price in NPR
      category: FoodCategory.curry,
    ),

    // Snacks
    Food(
      name: "Sel Roti",
      imagePath: "images/snacks/sel_roti.jpg",
      description: "Sweet rice bread, traditionally served during festivals.",
      price: 700.00, // Updated price in NPR
      category: FoodCategory.snacks,
    ),
    Food(
      name: "Choila",
      imagePath: "images/snacks/choila.jpg",
      description: "Spicy grilled meat dish, typically made with buffalo or chicken.",
      price: 1200.00, // Updated price in NPR
      category: FoodCategory.snacks,
    ),
    Food(
      name: "Gundruk",
      imagePath: "images/snacks/gundruk.jpg",
      description: "Fermented leafy green vegetables, a popular side dish.",
      price: 500.00, // Updated price in NPR
      category: FoodCategory.snacks,
    ),
    Food(
      name: "Alu Achaar",
      imagePath: "images/snacks/alu_achaar.jpg",
      description: "Spicy potato salad with sesame and spices.",
      price: 500.00, // Updated price in NPR
      category: FoodCategory.snacks,
    ),
    Food(
      name: "Kinema",
      imagePath: "images/snacks/kinema.jpg",
      description: "Fermented soybean dish, popular in Eastern Nepal.",
      price: 600.00, // Updated price in NPR
      category: FoodCategory.snacks,
    ),

    // Desserts
    Food(
      name: "Khuwa Puri",
      imagePath: "images/desserts/khuwa_puri.jpg",
      description: "Sweet deep-fried bread made with milk solids.",
      price: 700.00, // Updated price in NPR
      category: FoodCategory.desserts,
    ),
    Food(
      name: "Yomari",
      imagePath: "images/desserts/yomari.jpg",
      description: "Steamed rice flour dumpling filled with sweet molasses.",
      price: 550.00, // Updated price in NPR
      category: FoodCategory.desserts,
    ),
    Food(
      name: "Lakhamari",
      imagePath: "images/desserts/lakhamari.jpg",
      description: "Sweet bread often shaped like a flower, popular in Newari cuisine.",
      price: 900.00, // Updated price in NPR
      category: FoodCategory.desserts,
    ),
    Food(
      name: "Kheer",
      imagePath: "images/desserts/kheer.jpg",
      description: "Rice pudding flavored with cardamom and nuts.",
      price: 750.00, // Updated price in NPR
      category: FoodCategory.desserts,
    ),
    Food(
      name: "Jeri",
      imagePath: "images/desserts/jeri.jpg",
      description: "Deep-fried sweet made from rice flour and sugar syrup.",
      price: 650.00, // Updated price in NPR
      category: FoodCategory.desserts,
    ),

    // Drinks
    Food(
      name: "Chiya",
      imagePath: "images/drinks/chiya.jpg",
      description: "Traditional Nepali spiced milk tea.",
      price: 300.00, // Updated price in NPR
      category: FoodCategory.drinks,
    ),
    Food(
      name: "Lassi",
      imagePath: "images/drinks/lassi.jpg",
      description: "Yogurt-based drink, available in sweet or salty varieties.",
      price: 500.00, // Updated price in NPR
      category: FoodCategory.drinks,
    ),
    Food(
      name: "Tongba",
      imagePath: "images/drinks/tongba.jpg",
      description: "Traditional fermented millet beer from Eastern Nepal.",
      price: 750.00, // Updated price in NPR
      category: FoodCategory.drinks,
    ),
    Food(
      name: "Jaand",
      imagePath: "images/drinks/jaand.jpg",
      description: "Rice beer, a popular alcoholic beverage in Nepal.",
      price: 650.00, // Updated price in NPR
      category: FoodCategory.drinks,
    ),
    Food(
      name: "Butter Tea",
      imagePath: "images/drinks/butter_tea.jpg",
      description: "Tibetan-style tea made with yak butter, popular in mountainous regions.",
      price: 500.00, // Updated price in NPR
      category: FoodCategory.drinks,
    ),
  ];

  // G e t t e r s
  List<Food> get menu => _menu;

  List<CartItem> get cart => _cart;

  // O p e r a t i o n s

  //user cart
  final List<CartItem> _cart = [];

  // add to cart
  void addToCart(Food food) {
    // see if there is a cart item already with the same food
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      return item.food == food;
    });
    //if it already exists, increase its quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    // otherwise, add a new cart item to the cart
    else {
      _cart.add(
        CartItem(
          food: food,
        ),
      );
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIdex = _cart.indexOf(cartItem);

    if (cartIdex != -1) {
      if (_cart[cartIdex].quantity > 1) {
        _cart[cartIdex].quantity--;
      } else {
        _cart.removeAt(cartIdex);
      }
    }
    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      total += cartItem.food.price * cartItem.quantity;
    }
    return total;
  }

  // get total items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
