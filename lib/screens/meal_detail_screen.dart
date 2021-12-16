import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite,this.isFavorite);

  Widget detailsSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: GoogleFonts.aleo().fontFamily),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      height: 200,
      width: 360,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
        //backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            detailsSectionTitle(context, 'Ingredients'),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Colors.yellow[100],
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    selectedMeal.ingredients[index],
                    style: TextStyle(
                        fontFamily: GoogleFonts.aleo().fontFamily,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              itemCount: selectedMeal.ingredients.length,
            )),
            detailsSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                        child: Text('# ${(index + 1)}',
                            style: TextStyle(
                              fontFamily: GoogleFonts.aleo().fontFamily,
                            ))),
                    title: Text(selectedMeal.steps[index],
                        style: TextStyle(
                          fontFamily: GoogleFonts.aleo().fontFamily,
                        )),
                  ),
                  Divider()
                ],
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(isFavorite(mealId) 
          ? Icons.star : Icons.star_border
          ), 
          onPressed:() => toggleFavorite(mealId)),
    );
  }
}
