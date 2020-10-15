import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static String routeName = "/category-meals";
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String catTitle;
  List<Meal> displayeMeals;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    catTitle = routeArgs["title"];
    final catId = routeArgs["id"];
    displayeMeals = widget.availableMeals.where((element) {
      return element.categories.contains(catId);
    }).toList();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayeMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(catTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayeMeals[index].id,
              title: displayeMeals[index].title,
              imageUrl: displayeMeals[index].imageUrl,
              duration: displayeMeals[index].duration,
              complexity: displayeMeals[index].complexity,
              affordability: displayeMeals[index].affordability,
              removeItem: _removeMeal,
            );
          },
          itemCount: displayeMeals.length,
        ));
  }
}
