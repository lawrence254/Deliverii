import 'package:delifood/components/current_location.dart';
import 'package:delifood/components/custom_drawer.dart';
import 'package:delifood/components/custom_sliver_bar.dart';
import 'package:delifood/components/custom_tabs.dart';
import 'package:delifood/components/description_box.dart';
import 'package:flutter/material.dart';

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
    _tabController= TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
        body: TabBarView(
          controller: _tabController,
          children: [
            Text("Home"),
            Text("Profile"),
            Text("Cloud")
          ],
        ),
      ),
    );
  }

}