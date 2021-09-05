import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kowi/screens/yt_player.dart';
import 'package:kowi/widgets/dob.dart';
import 'package:kowi/widgets/height.dart';
import 'package:kowi/widgets/weight.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kowi",
      home: const Home(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(color: Colors.white, elevation: 0.0, titleTextStyle: TextStyle(color: Colors.red, fontSize: 30.0), iconTheme: IconThemeData(color: Colors.red)),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(headline3: TextStyle(color: Colors.red, fontSize: 25.0, letterSpacing: 1.0)),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red, accentColor: Colors.redAccent),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About Me"), leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () {},),),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const DOB(),
            const Height(),
            const Weight(),
            confirmButton(context),
          ],
        ),
      ),
    );
  }
  
  Widget confirmButton(BuildContext context) {
    return ElevatedButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const YTPlayer())), child: const Text("CONFIRM", style: TextStyle(letterSpacing: 2.0),), style: ElevatedButton.styleFrom(elevation: 10.0, shadowColor: Colors.red),);
  }
}

