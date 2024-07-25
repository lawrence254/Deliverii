import 'dart:math';

import 'package:delifood/models/restaurants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Receipt extends StatelessWidget{
  const Receipt({super.key});

  @override
  Widget build(BuildContext context) {
    String getEstimatedTime() {
      final now = DateTime.now();
      final random = Random();
      final randomMinutes = 15 + random.nextInt(16);
      final estimatedTime = now.add(Duration(minutes: randomMinutes));
      final DateFormat formatter = DateFormat('HH:mm');
      return formatter.format(estimatedTime);
    }
    final String estimatedTime= getEstimatedTime();

    return Padding(
        padding: const EdgeInsets.only(
            left: 25,
            right: 25,
            bottom: 25,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Thank you for ordering!"),
             const SizedBox(height: 25),
             Container(
               decoration: BoxDecoration(
                 border: Border.all(
                   color: Theme.of(context).colorScheme.secondary
                 ),
                 borderRadius: BorderRadius.circular(8)
               ),
               padding: const EdgeInsets.all(25),
               child:  Consumer<Restaurant>(builder: (context, restaurant,child)=> Text(restaurant.displayReceipt())),
             ),
            const SizedBox(height: 25),
            Text('Your order arrive at: $estimatedTime'),
          ],
              ),
        ),
    );
  }
}