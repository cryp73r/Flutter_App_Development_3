import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Widget>> _pages = const [
    {'page': CategoriesScreen(), 'title': Text('Categories')},
    {'page': FavoritesScreen(), 'title': Text('Your Favourites')},
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _pages[_selectedPageIndex]['title'],
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(backgroundColor: Theme.of(context).primaryColor, icon: const Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(backgroundColor: Theme.of(context).primaryColor, icon: const Icon(Icons.star), label: "Favourites"),
          ]
      ),
    );
  }
}
