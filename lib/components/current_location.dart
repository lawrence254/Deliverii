import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/restaurants.dart';

class CurrentLocation extends StatelessWidget{
  const CurrentLocation({super.key});


  void openLocationSearchBox(BuildContext context) {
    TextEditingController textController=TextEditingController();
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: const Text("Your location"),
      content: TextField(
        controller: textController,
        decoration: const InputDecoration(hintText: "Enter address"),
      ),
      actions: [
        MaterialButton(
          onPressed: ()=> Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        MaterialButton(
          onPressed: (){
            String newAddress=textController.text;
            context.read<Restaurant>().updateDeliveryAddress(newAddress);
            Navigator.pop(context);
            },
          child: const Text("Save "),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deliver Now",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),

          GestureDetector(
            onTap: ()=> openLocationSearchBox(context),
            child: Row(
              children: [
                Consumer<Restaurant>(
                  builder: (context, restaurant, child)=> Text(
                      restaurant.address,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold))),
                const Icon(Icons.keyboard_arrow_down_rounded)
            ]
            ),
          )

        ],
      ),
    );
  }



}