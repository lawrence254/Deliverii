import 'package:delifood/components/custom_button.dart';
import 'package:delifood/models/restaurants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';

class FoodPage extends StatefulWidget{
  final Food food;
  final Map<Addon, bool> selectedAddons = {};
  FoodPage({super.key,required this.food}){
    for(Addon addon in food.availableAddons){
      selectedAddons[addon]=false;
    }
  }

  @override
  State<StatefulWidget> createState()=> _FoodPage();

}

class _FoodPage extends State<FoodPage>{
  void addToCart(Food food, Map<Addon, bool> selectedAddons){
    Navigator.pop(context);
    List<Addon> currentlySelectedAddons=[];
    for(Addon addon in widget.food.availableAddons){
      if(widget.selectedAddons[addon]==true){
        currentlySelectedAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
                Image.asset(widget.food.imagePath),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.food.name,
                      style:const TextStyle(
                        fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),),
                      Text('Kes ${widget.food.price*120}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary
                        ),),
          
                      const SizedBox(height: 10,),
                      Text(widget.food.description),
                      Divider(color: Theme.of(context).colorScheme.secondary,),
                      const SizedBox(height: 10,),
                      Text("Add-ons",
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold
                        ),),
          
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics:const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: widget.food.availableAddons.length,
                            itemBuilder: (context,index){
                              Addon addon = widget.food.availableAddons[index];
                              return CheckboxListTile(
                                  title:Text(addon.name),
                                  subtitle: Text("Kes ${addon.price*120}", style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary
                                  ),),
                                  value:widget.selectedAddons[addon],
                                  onChanged: (bool? value){
                                    setState(() {
                                      widget.selectedAddons[addon]=value!;
                                    });
                                  }
                              );
                            }),
                      )
                    ],
                  ),
                ),
              CustomButton(onTap: ()=>addToCart(widget.food, widget.selectedAddons), label: "Add to cart"),
              const SizedBox(height: 25,),
            ],
          ),
        ),
      ),
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration:BoxDecoration(
                  color:Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle
              ),
              child: IconButton(
                icon:const Icon(Icons.arrow_back_rounded),
                onPressed: ()=>Navigator.pop(context ),
              ),
            ),
          ),
        )
    ]);
  }

}