import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tappit/screens/cart_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int quantity = 0;
  bool _switchValue = false;
  int tileValue = 0;

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
        IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => CartScreen(quantity: quantity)));
        }, icon: const Icon(Icons.shopping_cart_rounded, color: Colors.black54, size: 28.0,))
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SizedBox(
          height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom),
          child: LayoutBuilder(builder: (ctx, constraints){
            return SingleChildScrollView(
              child: GestureDetector(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
                        child: Row(
                          children: [
                            SizedBox(width: 50.0, height: constraints.maxHeight * 0.22,),
                            SizedBox(width: 50.0, height: constraints.maxHeight * 0.22,),
                          ],
                        ),
                      ),
                      CupertinoSearchTextField(
                        placeholder: "Search Your Food",
                        onChanged: (String value) => debugPrint(value),
                        onSubmitted: (String value) => debugPrint(value),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                const Expanded(child: Text("Menu", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.0, color: Colors.black87),)),
                                const Text("Veg only", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.0, color: Colors.black54),),
                                CupertinoSwitch(value: _switchValue, onChanged: (bool value) {
                                  setState(() {
                                    _switchValue = value;
                                  });
                                }),
                              ],
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 15.0), child: Text("TCS IT PARK II", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15.0, color: Colors.black38),)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: List.generate(10, (index) {
                          return Container(
                            margin: const EdgeInsets.only(top: 20.0),
                            height: constraints.maxHeight * 0.35,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(
                                    5.0,
                                    5.0,
                                  ),
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0,
                                ), //BoxShadow
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: Stack(
                                        children: [
                                          // Image.asset("assets/images/tappit.png", fit: BoxFit.fill,),
                                          Container(
                                            alignment: Alignment.topRight,
                                            child: FittedBox(
                                              child: Container(
                                                  padding: const EdgeInsets.all(3.0),
                                                  color: const Color(0xFF1BC47D),
                                                  child: Container(padding: const EdgeInsets.all(3.0), color: const Color(0xFF1BC47D), child: const Text("3.4 ⭐", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),)
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                  Expanded(
                                      flex: 6,
                                      child: Stack(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: const [
                                                  Text("Roasted Dosa", style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w500),),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: const [
                                                  Text("Weight 130g", style: TextStyle(fontSize: 15.0, color: Colors.black26, fontWeight: FontWeight.w500)),
                                                ],
                                              ),
                                              Wrap(children: const [Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", style: TextStyle(fontSize: 15.0, color: Colors.black54, fontWeight: FontWeight.w500))]),
                                            ],
                                          ),
                                          quantity==0?GestureDetector(
                                            child: Container(
                                              alignment: Alignment.bottomCenter,
                                              padding: const EdgeInsets.only(bottom: 10.0),
                                              child: FittedBox(
                                                child: Container(
                                                    width: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFF1BC47D),
                                                      borderRadius: BorderRadius.circular(40.0),
                                                    ),
                                                    padding: const EdgeInsets.all(3.0),
                                                    child: Container(padding: const EdgeInsets.all(3.0), child: const Center(child: Text("Add", style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w700, letterSpacing: 2.0),)),)
                                                ),
                                              ),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                quantity += 1;
                                              });
                                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Item Added to Cart")));
                                            },
                                          ):Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                child: Container(
                                                  alignment: Alignment.bottomCenter,
                                                  padding: const EdgeInsets.only(bottom: 10.0),
                                                  child: FittedBox(
                                                    child: Container(
                                                        width: 50.0,
                                                        decoration: BoxDecoration(
                                                          color: const Color(0xFFF44336),
                                                          borderRadius: BorderRadius.circular(40.0),
                                                        ),
                                                        padding: const EdgeInsets.all(3.0),
                                                        child: Container(padding: const EdgeInsets.all(3.0), child: const Icon(Icons.minimize, color: Colors.white,),)
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  if (quantity>=2) {
                                                    setState(() {
                                                      quantity -= 1;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      quantity -= 1;
                                                    });
                                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Cart Empty!")));
                                                  }
                                                },
                                              ),
                                              const SizedBox(width: 13.0,),
                                              Container(
                                                alignment: Alignment.bottomCenter,
                                                padding: const EdgeInsets.only(bottom: 10.0),
                                                child: Text("$quantity", style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700,),),
                                              ),
                                              const SizedBox(width: 13.0,),
                                              GestureDetector(
                                                child: Container(
                                                  alignment: Alignment.bottomCenter,
                                                  padding: const EdgeInsets.only(bottom: 10.0),
                                                  child: FittedBox(
                                                    child: Container(
                                                        width: 50.0,
                                                        decoration: BoxDecoration(
                                                          color: const Color(0xFF1BC47D),
                                                          borderRadius: BorderRadius.circular(40.0),
                                                        ),
                                                        padding: const EdgeInsets.all(3.0),
                                                        child: Container(padding: const EdgeInsets.all(3.0), child: const Icon(Icons.add, color: Colors.white,),)
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    quantity += 1;
                                                  });
                                                },
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            );
          })
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
