import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints){
      return SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CupertinoSearchTextField(
                placeholder: "Search for stores",
                onChanged: (String value) => debugPrint(value),
                onSubmitted: (String value) => debugPrint(value),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
                child: Row(
                  children: [
                    SizedBox(width: 50.0, height: constraints.maxHeight * 0.22,),
                    SizedBox(width: 50.0, height: constraints.maxHeight * 0.22,),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(child: Text("10 Stores around you", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0, color: Colors.black87),)),
                      const Text("Veg only", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.0, color: Colors.black54),),
                      CupertinoSwitch(value: _switchValue, onChanged: (bool value) {
                        setState(() {
                          _switchValue = value;
                        });
                      }),
                    ],
                  ),
                  const Text("TCS IT PARK II", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15.0, color: Colors.black38),),
                ],
              ),
              Column(
                children: List.generate(10, (index) {
                  return GestureDetector(
                    child: Container(
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
                                flex: 6,
                                child: Stack(
                                  children: [
                                    // Image.asset("assets/images/tappit.png", fit: BoxFit.fill,),
                                    Container(
                                      alignment: Alignment.bottomLeft,
                                      child: FittedBox(
                                        child: Container(
                                          padding: const EdgeInsets.all(3.0),
                                          color: const Color(0xFF1BC47D),
                                          child: Row(
                                            children: const [
                                              Icon(CupertinoIcons.sportscourt, color: Colors.white,),
                                              Text(" TAPPIT 50", style: TextStyle(color: Colors.white),)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Expanded(child: Text("Sathya Shop", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700),),),
                                        Container(padding: const EdgeInsets.all(3.0), color: const Color(0xFF1BC47D), child: const Text("3.4 ⭐", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),)
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Icon(CupertinoIcons.tuningfork, size: 19.0,),
                                        Expanded(child: Text(" South Indian", style: TextStyle(fontSize: 15.0, color: Colors.black54, fontWeight: FontWeight.w500),),),
                                        Text("₹ 100 for one", style: TextStyle(fontSize: 15.0, color: Colors.black26, fontWeight: FontWeight.w500))
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Icon(Icons.stream, size: 19.0,),
                                        Text(" 30% offer upto 100", style: TextStyle(fontSize: 15.0, color: Colors.black54, fontWeight: FontWeight.w500),)
                                      ],
                                    )
                                  ],
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/menuScreen");
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
