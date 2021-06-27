import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic>? appList;
  Map<dynamic, dynamic>? app;
  String? referenceId;
  String? txMsg;
  String? txStatus;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Payment'),
        ),
        body: Column(
          children: [
            Center(
              child: ElevatedButton(
                child: const Text('DO WEB PAYMENT'),
                onPressed: () => makePayment(),
              ),
            ),
            Center(
              child: ElevatedButton(
                child: const Text('DO UPI Payment'),
                onPressed: () => makeUpiPayment(),
              ),
            ),
            txStatus==null?const Center():AlertDialog(
              title: Text(txStatus!),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(txMsg!),
                  referenceId!=null?Text("Reference ID: $referenceId"):const Text(""),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    txStatus = null;
                    setState(() {});
                  },
                  child: const Text("OK")
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // WEB Intent
  makePayment() {
    String orderId = "ORDER_ID";
    String stage = "TEST";
    String orderAmount = "99";
    String tokenData = "TOKEN_DATA";
    String customerName = "Customer Name";
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "APP_ID";
    String customerPhone = "9094395340";
    String customerEmail = "sample@gmail.com";
    String notifyUrl = "https://test.gocashfree.com/notify";

    Map<String, dynamic> inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": tokenData,
      "notifyUrl": notifyUrl
    };

    txStatus = "";
    txMsg = "";
    referenceId = "";

    CashfreePGSDK.doPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
      if (key.toString()=="txStatus") {
        txStatus = value.toString();
      }
      if (key.toString()=="txMsg") {
        txMsg = value.toString();
      }
      if (key.toString()=="referenceId") {
        referenceId = value.toString();
      }
      setState(() {});
    }));
  }


  // UPI Intent
  Future<void> makeUpiPayment() async {
    String orderId = "ORDER_ID";
    String stage = "TEST";
    String orderAmount = "ORDER_AMOUNT";
    String tokenData = "TOKEN_DATA";
    String customerName = "Customer Name";
    String orderNote = "Order_Note";
    String orderCurrency = "INR";
    String appId = "APP_ID";
    String customerPhone = "9094395340";
    String customerEmail = "sample@gmail.com";
    String notifyUrl = "https://test.gocashfree.com/notify";


    Map<String, dynamic> inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": tokenData,
      "notifyUrl": notifyUrl
    };

    txStatus = "";
    txMsg = "";
    referenceId = "";

    CashfreePGSDK.doUPIPayment(inputParams)
        .then((value) => value?.forEach((key, value) {
      if (key.toString()=="txStatus") {
        txStatus = value.toString();
      }
      if (key.toString()=="txMsg") {
        txMsg = value.toString();
      }
      if (key.toString()=="referenceId") {
        referenceId = value.toString();
      }
      setState(() {});
    }));
  }
}
