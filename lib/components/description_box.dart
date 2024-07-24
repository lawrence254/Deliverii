import 'package:flutter/material.dart';

class DescriptionBox extends StatelessWidget{
  const DescriptionBox({super.key});



  @override
  Widget build(BuildContext context) {
    var primaryTextStyle=TextStyle(
        color: Theme.of(context).colorScheme.inversePrimary
    );

    var secondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary
    );
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(8)
        ),
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
          children: [
            Column(
              children: [
                Text("Shs 100", style: primaryTextStyle,),
                Text("Delivery Fee", style: secondaryTextStyle,)
              ],
            ),
            Column(
              children: [
                Text("15 - 30", style: primaryTextStyle,),
                Text("Delivery Time", style: secondaryTextStyle,)
              ],
            )
          ],
        ),
      ),
    );
  }

}