import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/filters_screen.dart';

class MyDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHolder) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      onTap: tapHolder,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.raleway().fontFamily,
        ),
      ),
    );
  }

  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            color: Colors.amber,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up !!',
              style: TextStyle(
                  fontFamily: GoogleFonts.merriweather().fontFamily,
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.redAccent[400]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings,
            () => Navigator.of(context).pushReplacementNamed(FilterScreen.routeName)
          )
        ],
      ),
    );
  }
}
