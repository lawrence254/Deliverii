import 'package:flutter/material.dart';

import '../models/food.dart';

class CustomQuantitySelector extends StatelessWidget{
  final Food food;
  final int quantity;
  final VoidCallback onIncreament;
  final VoidCallback onDecreament;
  const CustomQuantitySelector({super.key,
    required this.food,
    required this.quantity,
    required this.onIncreament,
    required this.onDecreament});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(50),
      ),
      padding:const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onDecreament,
            child: Icon(
              Icons.remove,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: 20,
              child: Center(
                  child: Text(quantity.toString()
                  )
              ),
            ),
          ),
          GestureDetector(
            onTap: onIncreament,
            child: Icon(
              Icons.add,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );

  }
}