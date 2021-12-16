import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/dummy_data.dart';


class CategoriesScreen extends StatelessWidget {
  //const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView(
        children: DUMMY_CATEGORIES
            .map(
              (catagData) =>
                  CategoryItem(catagData.id, catagData.title, catagData.color),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.1,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20),
      ),
    );
  }
}
