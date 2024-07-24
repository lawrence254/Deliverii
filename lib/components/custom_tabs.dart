import 'package:delifood/models/food.dart';
import 'package:flutter/material.dart';

class CustomTabs extends StatelessWidget{
  final TabController tabController;
  const CustomTabs({super.key, required this.tabController});

  List<Tab> _categoryTabsBuilder(){
    return FoodCategory.values.map((category){
      return Tab(
        text: category.toString().split(".").last,
    );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TabBar(
          controller: tabController,
            tabs: _categoryTabsBuilder(),
        )
    ,);
  }
}