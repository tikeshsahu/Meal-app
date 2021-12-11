// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:meals_app/category_meals_screen.dart';


class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(
    @required String this.id,
    @required String this.title,
    @required Color this.color, 
    
  );

  selectCategory(BuildContext ctx) {
    // navigation push method
    // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    //   return CategoryMealsScreen(
    //     categoryId: id,
    //     categoryTitle: title,
    //   );
    //  }
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
      'id' : id,
      'title' : title
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Colors.amber[200],
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        //color: ,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            color.withOpacity(0.7),
            color,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
