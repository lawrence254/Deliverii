import 'package:delifood/models/food.dart';
import 'package:flutter/material.dart';

class FoodTile extends StatelessWidget{
  final Food food;
  final void Function()? onTap;
  const FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(food.name),
                    Text('Kes ${food.price * 120}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(height: 10,),
                    Text(food.description, style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary ),),
                  ],
                )),
                const SizedBox(width: 15,),
                ClipRRect(borderRadius: BorderRadius.circular(8),child: Image.asset(food.imagePath, height: 120, width: 120,),)
              ],
            ),
          ),
        ),
        Divider(color: Theme.of(context).colorScheme.tertiary, endIndent: 25, indent: 25,)
      ],
    );
  }
}