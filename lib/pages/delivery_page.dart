import 'package:delifood/components/receipt.dart';
import 'package:delifood/models/restaurants.dart';
import 'package:delifood/services/database/firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryPage extends StatefulWidget{
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      String receipt = context.read<Restaurant>().displayReceipt();
      db.saveOrderToDatabase(receipt);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery Progress"),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomNavigationBar: _buildBottomNavigationBar(context),
      body: const Column(
        children: [
          Receipt()
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context){
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius:const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40))
      ),
      padding:const EdgeInsets.all(25),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: (){},
              icon: const Icon(Icons.person),
            ),
          ),
          const SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Jonathan Kianduthi",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              ),
              Text("Driver",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.call,
                    color: Colors.green,)
                  ,
                ),
              ),
              const SizedBox(width: 10,),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.message,
                    color: Colors.blue,),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}