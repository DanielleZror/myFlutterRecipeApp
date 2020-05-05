import 'package:flutter/material.dart';
import './HomePage.dart';
import './AllRecipesPage.dart';
import './FavoriteRecipesPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

const MaterialColor pink = const MaterialColor(
  0XFFE91E63,
  const <int, Color>{
    50: const Color(0xFF880E4F),
    100: const Color(0xFF880E4F),
    200: const Color(0xFF880E4F),
    300: const Color(0xFF880E4F),
    400: const Color(0xFF880E4F),
    500: const Color(0xFF880E4F),
    600: const Color(0xFF880E4F),
    700: const Color(0xFF880E4F),
    800: const Color(0xFF880E4F),
    900: const Color(0xFF880E4F),
  },
);

class MyAppState extends State<MyApp> {
  int _selectedPage = 0;
  final _pageOptions = [
    HomePage(),
    Text('Index 1: add'),
    AllRecipesPage(),
    FavoriteRecipesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Recipes',
      theme: ThemeData(
        primarySwatch: pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Recipes',
            style: TextStyle(color: Colors.pink),
          ),
          backgroundColor: Colors.grey[800],
        ),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[800],
          currentIndex: _selectedPage,
          unselectedItemColor: Colors.white,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              title: Text('Add'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              title: Text('All'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text('Loved'),
            ),
          ],
        ),
      ),
    );
  }
}
