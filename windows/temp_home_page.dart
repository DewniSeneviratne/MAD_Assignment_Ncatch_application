import 'package:flutter/material.dart';

import 'navigation_drawer.dart';

class TempHomePage extends StatelessWidget {
  const TempHomePage({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) => Scaffold(
        //removes the back button and add a menue button
        // drawer: const NavigationDrawer(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Home'),
        ),
        //insert the side navigation drawer
        drawer: const MyNavigationDrawer(),
      );
}
