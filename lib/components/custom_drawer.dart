import 'package:delifood/components/custom_drawer_tile.dart';
import 'package:flutter/material.dart';

import '../pages/settings.dart';

class CustomDrawer extends StatelessWidget{
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          CustomDrawerTile(label: "H O M E", icon: Icons.home, onTap: ()=>Navigator.pop(context)),
          CustomDrawerTile(
              label: "S E T T I N G S",
              icon: Icons.settings,
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage())
              )
          ),

          const Spacer(),
          CustomDrawerTile(label: "L O G O U T", icon: Icons.logout, onTap: (){}),
          const SizedBox(height: 25,)

        ],
      ),
    );
  }

}