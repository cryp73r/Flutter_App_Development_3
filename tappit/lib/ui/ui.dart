import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tappit/screens/home.dart';
import 'package:tappit/screens/menu_screen.dart';

class UI extends StatelessWidget {
  const UI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tapp!t",
      theme: ThemeData(
        primarySwatch: Colors.green,
          brightness: Brightness.light
      ),
      home: const Home(),
      routes: {
        "/menuScreen": (_) => const MenuScreen(),
      },
    );
  }
}
