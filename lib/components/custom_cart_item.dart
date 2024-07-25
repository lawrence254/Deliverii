import 'package:delifood/components/custom_quantity_selector.dart';
import 'package:delifood/models/cart_item.dart';
import 'package:delifood/models/restaurants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCartItem extends StatelessWidget{
  final CartItem cartItem;
  const CustomCartItem({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child)=>
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                    child: Image.asset(cartItem.food.imagePath,
                        width: 100,
                        height: 100,)
                ),
                const SizedBox( width: 10,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cartItem.food.name,
                      style: const TextStyle(
                        fontSize: 20,
                    ),),
                    Text('Kes ${cartItem.food.price*120}')
                  ],
                ),
                const Spacer(),
                CustomQuantitySelector(
                    food: cartItem.food,
                    quantity: cartItem.quantity,
                    onIncreament:(){ restaurant.addToCart(
                      cartItem.food,
                      cartItem.selectedAddons
                    );},
                    onDecreament: (){
                      restaurant.removeFromCart(cartItem);
                    }
                )

              ],
            ),
          ),
          SizedBox(
            height: cartItem.selectedAddons.isEmpty ?0:60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
              children: cartItem.selectedAddons.map((item)=>Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: FilterChip(
                    label: Row(
                      children: [
                        Text(item.name),
                        Text(' ${item.price*120}')
                      ],
                    ),
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      )
                    ),
                    onSelected: (value){},
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  labelStyle:TextStyle(color:Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 12),
                ),
              )).toList(),
            ),
          ) ,

        ],
        ),
        )
    );
  }
}