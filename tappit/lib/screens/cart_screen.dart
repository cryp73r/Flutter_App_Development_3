import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tappit/models/item_model.dart';

class CartScreen extends StatefulWidget {
  int quantity;

  CartScreen({Key? key, required this.quantity}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int tileValue = 0;
  double? _height;

  final List<ItemModel> _itemList = [
    ItemModel(
        "Good Mocktail",
        0,
        300.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.location_on, color: Colors.black54, size: 28.0,),
        onPressed: () => debugPrint("Location"),
      ),
      title: Image.asset("assets/images/tappit.png", height: 100.0,),
      centerTitle: true,
    );

    _height = (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom);

    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  cartHolder(),
                  couponHolder(),
                  billHolder(),
                  SizedBox(height: _height! * 0.1,)
                ],
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: GestureDetector(
              child: Card(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: _height! * 0.1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.green,
                  child: const Center(
                    child: Text("SELECT PAYMENT METHOD", style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Will Show Available Payment Options Screen")));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget cartHolder() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      height: _height! * 0.28,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Text("ITEMS IN CART", style: headingStyle(),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Good Mocktail", style: bodyStyle(),),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          if (widget.quantity>=1) {
                            setState(() {
                              widget.quantity -= 1;
                            });
                          }
                        },
                        child: const Text("-", style: TextStyle(fontSize: 28.0),)
                    ),
                    Text("${widget.quantity}", style: bodyStyle(),),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            widget.quantity += 1;
                          });
                        },
                        child: const Text("+", style: TextStyle(fontSize: 20.0),)
                    ),
                  ],
                ),
                Text("₹ ${300 * widget.quantity}", style: bodyStyle(),),
              ],
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Suggestion for the resturant...",
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget couponHolder() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Card(
        child: ListTile(
          leading: const Icon(CupertinoIcons.sportscourt),
          title: const Text("COUPON CODE"),
          trailing: ElevatedButton(
            child: const Text("Apply"),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Will try to apply Coupon Code Entered")));
            },
          ),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Will Show Available Coupon Screen")));
          },
        ),
      ),
    );
  }

  Widget billHolder() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      height: _height! * 0.28,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("BILL DETAILS", style: headingStyle(),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Item Total", style: bodyStyle(),),
                Text("₹ ${300 * widget.quantity}", style: bodyStyle(),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Restaurant Charge"),
                Text(widget.quantity!=0?"₹ 300":"₹ 0"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("To Pay", style: impStyle(),),
                widget.quantity==0?Text("₹ ${300 * widget.quantity + 0}", style: impStyle(),):Text("₹ ${300 * widget.quantity + 300}", style: impStyle(),),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle headingStyle() {
    return const TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle bodyStyle() {
    return const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle impStyle() {
    return const TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    );
  }

}
