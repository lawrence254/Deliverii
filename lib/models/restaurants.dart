import 'package:collection/collection.dart';
import 'package:delifood/models/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier{
  final List<Food> _menu = [
    // Burgers (5)
    Food(
        foodCategory: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 1.0),
          Addon(name: "Bacon", price: 1.5),
          Addon(name: "Avocado", price: 2.0),
          Addon(name: "Grilled Onions", price: 0.5),
          Addon(name: "Mushrooms", price: 1.0)
        ],
        name: "Classic Burger",
        description: "Juicy beef patty with lettuce, tomato, and cheese.",
        imagePath: "lib/images/burgers/1.png",
        price: 8.99
    ),
    Food(
        foodCategory: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 1.0),
          Addon(name: "Bacon", price: 1.5),
          Addon(name: "Jalapeños", price: 0.5),
          Addon(name: "Guacamole", price: 1.5),
          Addon(name: "Fried Egg", price: 1.0)
        ],
        name: "Spicy Jalapeño Burger",
        description: "Beef patty with jalapeños, pepper jack cheese, and spicy mayo.",
        imagePath: "lib/images/burgers/2.png",
        price: 9.49
    ),
    Food(
        foodCategory: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 1.0),
          Addon(name: "Bacon", price: 1.5),
          Addon(name: "Caramelized Onions", price: 0.5),
          Addon(name: "Blue Cheese", price: 1.5),
          Addon(name: "BBQ Sauce", price: 0.5)
        ],
        name: "BBQ Bacon Burger",
        description: "Beef patty with bacon, cheddar cheese, and BBQ sauce.",
        imagePath: "lib/images/burgers/3.png",
        price: 10.49
    ),
    Food(
        foodCategory: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 1.0),
          Addon(name: "Bacon", price: 1.5),
          Addon(name: "Grilled Pineapple", price: 1.0),
          Addon(name: "Teriyaki Sauce", price: 0.5),
          Addon(name: "Swiss Cheese", price: 1.0)
        ],
        name: "Hawaiian Burger",
        description: "Beef patty with grilled pineapple, teriyaki sauce, and Swiss cheese.",
        imagePath: "lib/images/burgers/4.png",
        price: 10.99
    ),
    Food(
        foodCategory: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese", price: 1.0),
          Addon(name: "Bacon", price: 1.5),
          Addon(name: "Avocado", price: 2.0),
          Addon(name: "Sautéed Mushrooms", price: 1.0),
          Addon(name: "Truffle Mayo", price: 1.5)
        ],
        name: "Gourmet Burger",
        description: "Premium beef patty with truffle mayo, sautéed mushrooms, and Swiss cheese.",
        imagePath: "lib/images/burgers/5.png",
        price: 12.49
    ),

    // Drinks (5)
    Food(
        foodCategory: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Lemon", price: 0.5),
          Addon(name: "Mint", price: 0.5),
          Addon(name: "Ice", price: 0.0)
        ],
        name: "Classic Lemonade",
        description: "Refreshing lemonade made with fresh lemons.",
        imagePath: "lib/images/drinks/1.png",
        price: 2.99
    ),
    Food(
        foodCategory: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Whipped Cream", price: 0.5),
          Addon(name: "Caramel Drizzle", price: 0.5),
          Addon(name: "Extra Espresso Shot", price: 1.0)
        ],
        name: "Iced Coffee",
        description: "Chilled coffee with a hint of vanilla.",
        imagePath: "lib/images/drinks/2.png",
        price: 3.99
    ),
    Food(
        foodCategory: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Whipped Cream", price: 0.5),
          Addon(name: "Chocolate Drizzle", price: 0.5),
          Addon(name: "Extra Chocolate", price: 1.0)
        ],
        name: "Chocolate Milkshake",
        description: "Rich chocolate milkshake topped with whipped cream.",
        imagePath: "lib/images/drinks/3.png",
        price: 4.99
    ),
    Food(
        foodCategory: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Whipped Cream", price: 0.5),
          Addon(name: "Extra Matcha", price: 1.0),
          Addon(name: "Honey", price: 0.5)
        ],
        name: "Matcha Latte",
        description: "Creamy matcha latte with a hint of sweetness.",
        imagePath: "lib/images/drinks/4.png",
        price: 4.49
    ),
    Food(
        foodCategory: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Lemon", price: 0.5),
          Addon(name: "Mint", price: 0.5),
          Addon(name: "Honey", price: 0.5)
        ],
        name: "Iced Tea",
        description: "Chilled black tea with a hint of lemon.",
        imagePath: "lib/images/drinks/5.png",
        price: 2.49
    ),

    // Sides (5)
    Food(
        foodCategory: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Cheese Sauce", price: 1.0),
          Addon(name: "Bacon Bits", price: 1.5),
          Addon(name: "Chili", price: 1.5)
        ],
        name: "French Fries",
        description: "Crispy golden fries.",
        imagePath: "lib/images/sides/1.jpg",
        price: 2.99
    ),
    Food(
        foodCategory: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Cheese Sauce", price: 1.0),
          Addon(name: "Ranch Dressing", price: 0.5),
          Addon(name: "Buffalo Sauce", price: 0.5)
        ],
        name: "Onion Rings",
        description: "Crispy fried onion rings.",
        imagePath: "lib/images/sides/2.jpg",
        price: 3.49
    ),
    Food(
        foodCategory: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Cheese Sauce", price: 1.0),
          Addon(name: "Sour Cream", price: 0.5),
          Addon(name: "Green Onions", price: 0.5)
        ],
        name: "Loaded Potato Skins",
        description: "Potato skins topped with cheese and bacon.",
        imagePath: "lib/images/sides/3.jpg",
        price: 4.99
    ),
    Food(
        foodCategory: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Cheese Sauce", price: 1.0),
          Addon(name: "Marinara Sauce", price: 0.5),
          Addon(name: "Ranch Dressing", price: 0.5)
        ],
        name: "Mozzarella Sticks",
        description: "Fried mozzarella sticks served with marinara sauce.",
        imagePath: "lib/images/sides/4.jpg",
        price: 4.49
    ),
    Food(
        foodCategory: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Cheese Sauce", price: 1.0),
          Addon(name: "BBQ Sauce", price: 0.5),
          Addon(name: "Buffalo Sauce", price: 0.5)
        ],
        name: "Chicken Wings",
        description: "Crispy chicken wings tossed in your choice of sauce.",
        imagePath: "lib/images/sides/5.jpg",
        price: 6.99
    ),

    // Dessert (5)
    Food(
        foodCategory: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Whipped Cream", price: 0.5),
          Addon(name: "Chocolate Sauce", price: 0.5),
          Addon(name: "Sprinkles", price: 0.5)
        ],
        name: "Vanilla Ice Cream",
        description: "Creamy vanilla ice cream.",
        imagePath: "lib/images/desserts/1.png",
        price: 3.49
    ),
    Food(
        foodCategory: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Whipped Cream", price: 0.5),
          Addon(name: "Caramel Sauce", price: 0.5),
          Addon(name: "Pecans", price: 0.5)
        ],
        name: "Caramel Sundae",
        description: "Vanilla ice cream topped with caramel sauce and pecans.",
        imagePath: "lib/images/desserts/2.png",
        price: 4.49
    ),
    Food(
        foodCategory: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Whipped Cream", price: 0.5),
          Addon(name: "Chocolate Chips", price: 0.5),
          Addon(name: "Chocolate Sauce", price: 0.5)
        ],
        name: "Chocolate Brownie",
        description: "Rich chocolate brownie served warm.",
        imagePath: "lib/images/desserts/3.png",
        price: 3.99
    ),
    Food(
        foodCategory: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Whipped Cream", price: 0.5),
          Addon(name: "Caramel Sauce", price: 0.5),
          Addon(name: "Chopped Nuts", price: 0.5)
        ],
        name: "Apple Pie",
        description: "Classic apple pie with a flaky crust.",
        imagePath: "lib/images/desserts/4.png",
        price: 3.99
    ),
    Food(
        foodCategory: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Whipped Cream", price: 0.5),
          Addon(name: "Strawberry Sauce", price: 0.5),
          Addon(name: "Fresh Strawberries", price: 1.0)
        ],
        name: "Strawberry Cheesecake",
        description: "Creamy cheesecake topped with strawberry sauce.",
        imagePath: "lib/images/desserts/5.png",
        price: 4.99
    ),

    // Salads (5)
    Food(
        foodCategory: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Grilled Chicken", price: 2.0),
          Addon(name: "Avocado", price: 1.5),
          Addon(name: "Bacon Bits", price: 1.0)
        ],
        name: "Caesar Salad",
        description: "Crisp romaine lettuce with Caesar dressing, croutons, and Parmesan cheese.",
        imagePath: "lib/images/salads/1.png",
        price: 6.99
    ),
    Food(
        foodCategory: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Grilled Chicken", price: 2.0),
          Addon(name: "Avocado", price: 1.5),
          Addon(name: "Feta Cheese", price: 1.0)
        ],
        name: "Greek Salad",
        description: "Mixed greens with tomatoes, cucumbers, olives, and feta cheese.",
        imagePath: "lib/images/salads/2.png",
        price: 7.49
    ),
    Food(
        foodCategory: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Grilled Chicken", price: 2.0),
          Addon(name: "Avocado", price: 1.5),
          Addon(name: "Walnuts", price: 1.0)
        ],
        name: "Garden Salad",
        description: "Mixed greens with tomatoes, cucumbers, and carrots.",
        imagePath: "lib/images/salads/3.png",
        price: 5.99
    ),
    Food(
        foodCategory: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Grilled Chicken", price: 2.0),
          Addon(name: "Avocado", price: 1.5),
          Addon(name: "Parmesan Cheese", price: 1.0)
        ],
        name: "Spinach Salad",
        description: "Fresh spinach with strawberries, walnuts, and balsamic vinaigrette.",
        imagePath: "lib/images/salads/4.png",
        price: 7.99
    ),
    Food(
        foodCategory: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Grilled Chicken", price: 2.0),
          Addon(name: "Avocado", price: 1.5),
          Addon(name: "Blue Cheese Crumbles", price: 1.0)
        ],
        name: "Cobb Salad",
        description: "Mixed greens with chicken, bacon, egg, avocado, and blue cheese.",
        imagePath: "lib/images/salads/5.png",
        price: 8.99
    ),
  ];

  final List<CartItem> _cart =[];

  void addToCart(Food food, List<Addon> selectedAddons){
    CartItem? cartItem = _cart.firstWhereOrNull((item){
       bool isSameFood = item.food == food;

       bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);

       return isSameFood && isSameAddons;
    });

    if(cartItem !=null){
      cartItem.quantity++;
    }else{
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem){
    int cartIndex = _cart.indexOf(cartItem);

    if(cartIndex != -1){
      if(_cart[cartIndex].quantity>1){
        _cart[cartIndex].quantity--;
      }else{
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  double getTotalPrice(){
    double total = 0.0;

    for(CartItem item in _cart){
      double itemTotal = item.food.price;
      for(Addon addon in item.selectedAddons){
        itemTotal += addon.price;
      }
      total += itemTotal * item.quantity;
    }
    return total;
  }


  int getTotalItemCount(){
    int itemCount=0;
    for(CartItem item in _cart){
      itemCount+=item.quantity;
    }
    return itemCount;
}

void clearCart(){
    _cart.clear();
    notifyListeners();
}

String displayReceipt(){
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    String formattedDate = DateFormat("dd-mm-yyyy HH:mm:ss").format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("***************");

    for(final cartItem in _cart){
      receipt.writeln(
        '${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price*120)}'
      );
      if(cartItem.selectedAddons.isNotEmpty){
        receipt.writeln(
          'Add-ons: ${_formatAddons(cartItem.selectedAddons)}'
        );

      }
      receipt.writeln();
    }
    receipt.writeln("***************");
    receipt.writeln();
    receipt.writeln('Total items: ${getTotalItemCount()}');
    receipt.writeln('Total Price: ${_formatPrice(getTotalPrice()*120)}');

return receipt.toString();
}

String _formatPrice(double price){
    return 'Kes ${price.toStringAsFixed(2)}';
}

String _formatAddons(List<Addon> addons){
     return addons.map((addon)=>'${addon.name} (Kes ${_formatPrice(addon.price*120)})').join(", ");
}

  List<Food> get menu=> _menu;
  List<CartItem> get cart => _cart;

}
