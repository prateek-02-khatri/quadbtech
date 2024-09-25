import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadb_tech/provider/app_provider.dart';
import 'package:quadb_tech/screen/home/home_screen.dart';
import 'package:quadb_tech/screen/search/search_screen.dart';
import 'package:quadb_tech/utils/app_color.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {

  List<Widget> screen = [
    const HomeScreen(),
    const SearchScreen(),
    const Scaffold(
      body: Center(
        child: Text(
          'Profile Screen',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider value, Widget? child) {
        return Scaffold(
          body: screen[value.currentScreen],

          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: greyColor,
            currentIndex: value.currentScreen,

            selectedIconTheme: const IconThemeData(
                color: Colors.white,
                size: 32
            ),
            unselectedIconTheme: const IconThemeData(
                color: darkGreyColor,
                size: 30
            ),

            selectedLabelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
            unselectedLabelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),

            selectedItemColor: Colors.white,
            unselectedItemColor: darkGreyColor,

            onTap: (index) {
              value.setCurrentScreen(index);
            },

            items: [
              navigationItems(
                  icon: Icons.home,
                  label: 'Home'
              ),

              navigationItems(
                  icon: Icons.search,
                  label: 'Search'
              ),

              navigationItems(
                  icon: Icons.person,
                  label: 'Profile'
              )
            ],
          ),
        );
      },
    );
  }

  BottomNavigationBarItem navigationItems({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
      ),
      label: label
    );
  }
}
