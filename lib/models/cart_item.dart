// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_food_delivery_app/models/food.dart';

class CartItem {
  Food food;
  int quantity;

  CartItem({
    required this.food,
    this.quantity = 1,
  });

  double get totalPrice => food.price * quantity;
}
