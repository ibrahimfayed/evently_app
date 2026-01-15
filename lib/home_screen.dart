import 'package:evently_app/nav_bar_icon.dart';
import 'package:evently_app/tabs/favorite/favorite_tab.dart';
import 'package:evently_app/tabs/home/home_tab.dart';
import 'package:evently_app/tabs/profile/profile_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    //هنا الترتيب مهم
    HomeTab(),
    FavoriteTab(),
    ProfileTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: NavBarIcon(imageName: 'home'),
            activeIcon: NavBarIcon(imageName: 'home_active'),
          ),
          BottomNavigationBarItem(
            label: 'Favorite',
            icon: NavBarIcon(imageName: 'favorite'),
            activeIcon: NavBarIcon(imageName: 'favorite_active'),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: NavBarIcon(imageName: 'profile'),
            activeIcon: NavBarIcon(imageName: 'profile_active'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        
      },
      child: Icon(Icons.add,
      size: 28,),
      
      ),
    );
  }
}
