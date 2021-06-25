import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tappit/screens/cart_screen.dart';
import 'package:tappit/screens/home_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int tileValue = 0;

  _getConnection() async {
    try {
      final checkConnectivity = await InternetAddress.lookup("google.com");
      if (checkConnectivity.isNotEmpty && checkConnectivity[0].rawAddress.isNotEmpty) {
        debugPrint('Connected');
      }
    }
    on SocketException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("NO INTERNET CONNECTION")));
    }
  }

  @override
  void initState() {
    _getConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.location_on, color: Colors.black54, size: 28.0,),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Fetch Location")));
        },
      ),
      title: Image.asset("assets/images/tappit.png", height: 100.0,),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => CartScreen(quantity: 0)));
            },
            icon: const Icon(Icons.shopping_cart_rounded, color: Colors.black54, size: 28.0,)
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SizedBox(
          height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom),
          child: tileValue==1?CupertinoAlertDialog(
            title: const Text("Subscription Plan"),
            content: Column(
              children: [
                const Text("Please Choose a Plan"),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        tileValue = 0;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Shows Subscription Plans")));
                    },
                    child: const Text("Delivery once")
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        tileValue = 0;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Shows Subscription Plans")));
                    },
                    child: const Text("Subscribe")
                ),
              ],
            ),
          ):const HomeScreen()
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            tileValue = index;
          });
        },
        currentIndex: tileValue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.tray),
            label: "Cafeteria",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.arrow_2_circlepath),
            label: "Subscription",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bolt),
            label: "Flash Sale",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}