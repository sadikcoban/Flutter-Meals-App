import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "../dummy_data.dart";

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";

  Widget buildSectionTitle(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style:
            GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
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
            buildSectionTitle("Ingredients"),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: Colors.yellow[800],
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
              ),
            ),
            buildSectionTitle("Steps"),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(child: Text("# ${(index + 1)}")),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
