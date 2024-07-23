import 'package:flutter/material.dart';

import 'package:flutter_food_delivery_app/components/my_button.dart';
import 'package:flutter_food_delivery_app/models/food.dart';
import 'package:flutter_food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatelessWidget {
  final Food food;

  const FoodPage({
    super.key,
    required this.food,
  });

  void addToCart(BuildContext context, Food food) {
    //close the current page to go back to menu page
    Navigator.pop(context);

    //add to cart
    context.read<Restaurant>().addToCart(food,);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // food image
                  SizedBox(
                    width: 400,
                    child: Container(
                      margin: const EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 6,
                            offset: Offset(2, 2),
                          )
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          food.imagePath,
                        ),
                      ),
                    ),
                  ),

                  // food details
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // food price
                        Text(
                          '\Rs. ${food.price}',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 10),

                        // food description
                        Text(
                          food.description,
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // add to cart button
                  MyButton(
                    text: 'Add to Cart',
                    onTap: () => addToCart(context, food),
                  ),

                  const SizedBox(
                    height: 25,
                  )
                ],
              ),
            ),
          ),
        ),

        // back button
        SafeArea(
          child: Opacity(
            opacity: 0.7,
            child: Container(
              margin: const EdgeInsets.only(left: 25, top: 25),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_rounded),
              ),
            ),
          ),
        ),
      ],
    );
  }
}