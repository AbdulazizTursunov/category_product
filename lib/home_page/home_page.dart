import 'package:category_product/bottom_nav_bar/tab_box.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Home Page',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body:const BottomNavBar(),
    );
  }
}
