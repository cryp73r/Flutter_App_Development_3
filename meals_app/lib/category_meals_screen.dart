import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String? categoryId;
  final String? categoryTitle;
  const CategoryMealsScreen({Key? key, this.categoryId, this.categoryTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: const Center(
        child: Text("The Recepies For The Category"),
      ),
    );
  }
}
