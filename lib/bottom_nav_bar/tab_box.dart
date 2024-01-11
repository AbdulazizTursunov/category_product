

import 'package:category_product/bottom_nav_bar/all_product/all_product.dart';
import 'package:category_product/bottom_nav_bar/category/category.dart';
import 'package:flutter/material.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  List<Widget> screens= [];
  int _indexScreen=1;

  @override
  void initState() {
    screens = [
    const   AllProduct(),
      CategoryScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_indexScreen],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexScreen,
        onTap: (v){
          setState(() {
            _indexScreen = v;
          });
        },
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.production_quantity_limits),label: "product"),
          BottomNavigationBarItem(icon: Icon(Icons.category),label: "category"),
        ],
      ),
    );
  }

}
