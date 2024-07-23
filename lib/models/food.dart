//food item
class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;

  Food({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.price,
    required this.category,
  });
}

//food category
enum FoodCategory {
  dalBhat,
  momo,
  curry,
  snacks,
  desserts,
  drinks,
}

// food addons
