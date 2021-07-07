import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = dummyMeals.where((meal) {
      return meal.categories!.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
              title: categoryMeals[index].title!,
              imageUrl: categoryMeals[index].imageUrl!,
              duration: categoryMeals[index].duration!,
              complexity: categoryMeals[index].complexity!,
              affordability: categoryMeals[index].affordability!);
          },
      ),
    );
  }
}
