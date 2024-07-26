import 'package:delifood/components/custom_button.dart';
import 'package:delifood/components/custom_cart_item.dart';
import 'package:delifood/models/restaurants.dart';
import 'package:delifood/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget{
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child){
      final userCart = restaurant.cart;
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        appBar: AppBar(
          title: const Text("Cart"),
          backgroundColor: Colors.transparent,
           foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            IconButton(onPressed: (){
              showDialog(
                  context:context,
                  builder: (context)=> AlertDialog(
                title: const Text("Delete items in Cart?"),
                actions: [
                  TextButton(onPressed: ()=>Navigator.pop(context), child: const Text("Cancel")),
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                    restaurant.clearCart();
                  }, child: const Text("Yes"),),
                ],
              ));
            },
                icon: const Icon(Icons.delete)
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty ?  const Expanded(child: Center(child:Text("Let's add some items to our cart..."))):Expanded(
                      child: ListView.builder(
                          itemCount:userCart.length,
                          itemBuilder: (context, index) {
                            final cartItem = userCart[index];
                            return CustomCartItem(cartItem: cartItem);
                          }
                  ),
                  )
                ],
              ),
            ),
              CustomButton(onTap: ()=> Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>const PaymentPage())
              ), label: "Checkout"),
            const SizedBox(height: 25,)
          ],
        ),

      );
    });
  }
}