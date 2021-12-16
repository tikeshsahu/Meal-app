import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabScreenState extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabScreenState(this.favoriteMeals);
  @override
  State<TabScreenState> createState() => TabScreenStateState();
}

class TabScreenStateState extends State<TabScreenState> {
  List<Map<String, Object>> pages;
  int selectedPageIndex = 0;

  @override
  void initState() {
    pages = [
    {'page': CategoriesScreen(), 
    'title': 'Categories'},
    {'page': FavoritesScreen(widget.favoriteMeals), 
    'title': 'Your Favorites'}
  ];
    super.initState();
  }

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title']),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectPage,
          backgroundColor: Colors.pink,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: selectedPageIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text('Categories')),
            BottomNavigationBarItem(
                icon: Icon(Icons.star_border), title: Text('Favorites'))
          ]),
    );
  }
}
