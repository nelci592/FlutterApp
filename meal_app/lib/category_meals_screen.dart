import 'dart:js';

import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = './category_meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);
  
  @override
  Widget build(BuildContext context) {
    final routesArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routesArgs['id'];
    final categoryId = routesArgs['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text(
          'The Recipes For The Category',
        )
      ),
    );
  }
}