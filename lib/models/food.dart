class Food{
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory foodCategory;
  final List<Addon> availableAddons;

  Food({required this.foodCategory, required this.availableAddons, required this.name, required this.description, required this.imagePath, required this.price});
}

enum FoodCategory{
  burgers,
  salads,
  sides,
  desserts,
  drinks
}

class Addon{
  final String  name;
  final double price;

  Addon({required this.name, required this.price});
}