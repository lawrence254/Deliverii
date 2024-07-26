import 'package:delifood/components/custom_drawer_tile.dart';
import 'package:delifood/services/auth/auth_gate.dart';
import 'package:flutter/material.dart';

import '../pages/settings.dart';
import '../services/auth/auth_service.dart';

class CustomDrawer extends StatelessWidget{
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    void logout() async{
      final authService = AuthService();
      authService.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthGate()),
      );
    }
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
          CustomDrawerTile(label: "L O G O U T", icon: Icons.logout, onTap: logout),
          const SizedBox(height: 25,)

        ],
      ),
    );
  }

}
