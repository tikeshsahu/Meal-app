import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters,this.saveFilters);
  //const FilterScreen({Key key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

     @override
  initState() {
    glutenFree = widget.currentFilters['gluten'];
    lactoseFree = widget.currentFilters['lactose'];
    vegetarian = widget.currentFilters['vegetarian'];
    vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Your Filters'), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': glutenFree,
                'lactose': lactoseFree,
                'vegan': vegan,
                'vegetarian': vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ]),
        //drawer: MyDrawer(),

        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust your Meal selection'),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTile('Gluten-free',
                      'Only include Gluten-free meals', glutenFree, (newValue) {
                    setState(() {
                      glutenFree = newValue;
                    });
                  }),
                  buildSwitchListTile(
                      'Lactose-free',
                      'Only include Lactose-free meals',
                      lactoseFree, (newValue) {
                    setState(() {
                      lactoseFree = newValue;
                    });
                  }),
                  buildSwitchListTile(
                      'Vegetarian', 'Only include Vegetarian meals', vegetarian,
                      (newValue) {
                    setState(() {
                      vegetarian = newValue;
                    });
                  }),
                  buildSwitchListTile(
                      'Vegan', 'Only include Vegan meals', vegan, (newValue) {
                    setState(() {
                      vegan = newValue;
                    });
                  })
                ],
              ),
            )
          ],
        ));
  }
}














// class FilterScreen extends StatefulWidget {
//   static const routeName = '/filters';
//   final Function saveFilters;
//   final Map<String, bool> currentFilters;

//   const FilterScreen({Key key, this.saveFilters, this.currentFilters}) : super(key: key);

//   @override
//   State<FilterScreen> createState() => _FilterScreenState();
// }

// class _FilterScreenState extends State<FilterScreen> {
//   bool glutenFree = false;
//   bool vegetarian = false;
//   bool vegan = false;
//   bool lactoseFree = false;

//    @override
//   initState() {
//     glutenFree = widget.currentFilters['gluten'];
//     lactoseFree = widget.currentFilters['lactose'];
//     vegetarian = widget.currentFilters['vegetarian'];
//     vegan = widget.currentFilters['vegan'];
//     super.initState();
//   }

//   Widget buildSwitchListTile(String title, String description,
//       bool currentValue, Function updateValue) {
//     return SwitchListTile(
//       title: Text(title),
//       value: currentValue,
//       subtitle: Text(description),
//       onChanged: updateValue,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Filters'),
//         //leading: MyDrawer()
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.save),
//             onPressed: () {
//               final selectedFilters = {
//                 'gluten': glutenFree,
//                 'lactose': lactoseFree,
//                 'vegan': vegan,
//                 'vegetarian': vegetarian,
//               };
//               widget.saveFilters(selectedFilters);
//             },
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Container(
//               child: Text(
//                 'Adjust your Meal selection',
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontFamily: GoogleFonts.roboto().fontFamily,
//                     fontSize: 20),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               children: [
//                 buildSwitchListTile(
//                     'Gluten-free', 'Only include Gluten-free meals', glutenFree,
//                     (newValue) {
//                   setState(() {
//                     glutenFree = newValue;
//                   });
//                 }),
//                 buildSwitchListTile('Lactose-free',
//                     'Only include Lactose-free meals', lactoseFree, (newValue) {
//                   setState(() {
//                     lactoseFree = newValue;
//                   });
//                 }),
//                 buildSwitchListTile(
//                     'Vegetarian', 'Only include Vegetarian meals', vegetarian,
//                     (newValue) {
//                   setState(() {
//                     vegetarian = newValue;
//                   });
//                 }),
//                 buildSwitchListTile('Vegan', 'Only include Vegan meals', vegan,
//                     (newValue) {
//                   setState(() {
//                     vegan = newValue;
//                   });
//                 })
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
