import 'package:flutter/material.dart';

class CustomTabs extends StatelessWidget{
  final TabController tabController;
  const CustomTabs({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TabBar(
          controller: tabController,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.person_2_rounded),
              ),
              Tab(
                icon: Icon(Icons.cloud_circle_rounded),
              )
            ],
        )
    ,);
  }
}