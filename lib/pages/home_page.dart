import 'package:delifood/components/current_location.dart';
import 'package:delifood/components/custom_drawer.dart';
import 'package:delifood/components/custom_sliver_bar.dart';
import 'package:delifood/components/custom_tabs.dart';
import 'package:delifood/components/description_box.dart';
import 'package:delifood/components/food_tile.dart';
import 'package:delifood/models/food.dart';
import 'package:delifood/models/restaurants.dart';
import 'package:delifood/pages/food_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController= TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterBycategory(FoodCategory category, List<Food> menu){
    return menu.where((food)=> food.foodCategory==category).toList();
  }

  List<Widget> getFoodInCategory(List<Food> fullMenu){
    return FoodCategory.values.map((category){
      List<Food> categoryMenu=_filterBycategory(category, fullMenu).toList();
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index){
          final food = categoryMenu[index];
          return FoodTile(food: food, onTap:  ()=>Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>FoodPage(food: food))
          ));
        },
      );
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context,innerBoxIsScrolled)=>[
           CustomSliverBar(
            title: CustomTabs(tabController: _tabController,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const CurrentLocation(),
                const DescriptionBox(),
              ]
            ),
          )
        ],
        body: Consumer<Restaurant>(builder: (context, restaurant, child)=>
          TabBarView(
            controller: _tabController,
            children: getFoodInCategory(restaurant.menu),
          ),
        ),
      ),
    );
  }

}