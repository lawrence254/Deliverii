import 'package:delifood/models/restaurants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget{
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child){
      final userCart = restaurant.cart;

      return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
          backgroundColor: Colors.transparent,
           foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount:userCart.length,
                    itemBuilder: (context, index)=>(
                      ListTile(
                        title: Text(userCart[index].food.name),
                      )
                )))
          ],
        ),
      );
    });
  }
}