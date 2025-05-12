import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:flutter/material.dart';

class SideMenuDrawerScreen extends StatefulWidget {
  const SideMenuDrawerScreen({super.key});

  @override
  State<SideMenuDrawerScreen> createState() => _SideMenuDrawerScreenState();
}

class _SideMenuDrawerScreenState extends State<SideMenuDrawerScreen> {
  late DrawerScaffoldController _controller;
  int selectedMenuItemId = 0;
  String name = 'shyamjith';

  final menu = Menu(
    items: [
      MenuItem(id: 0, title: 'Home', icon: Icons.home),
      MenuItem(id: 1, title: 'Profile', icon: Icons.person),
      MenuItem(id: 2, title: 'Settings', icon: Icons.settings),
      MenuItem(id: 3, title: 'Logout', icon: Icons.logout),
    ],
  );

  @override
  void initState() {
    super.initState();
    _controller = DrawerScaffoldController();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      controller: _controller,
      drawers: [
        SideDrawer(
          percentage: 0.6,
          menu: menu,
          direction: Direction.left,
          animation: true,
          color: Theme.of(context).primaryColor,
          selectedItemId: selectedMenuItemId,
          onMenuItemSelected: (itemId) {
            setState(() {
              selectedMenuItemId = itemId;
            });
          },
        ),
      ],
      builder:
          (context, id) => Center(
            child: Text(
              'Selected Page: ${menu.items[id].title}',
              style: TextStyle(fontSize: 24),
            ),
          ),
    );
  }
}
