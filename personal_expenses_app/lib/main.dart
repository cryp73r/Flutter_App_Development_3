import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<Transaction> transaction = [
    Transaction(
        id: 't1',
        title: 'New Shoes',
        amount: 2499.0,
        date: DateTime.now()
    ),
    Transaction(
        id: 't2',
        title: 'CASIO Wrist Watch',
        amount: 4599.0,
        date: DateTime.now()
    ),
  ];
  // String? titleInput;
  // String? amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter App"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text("CHART!"),
              elevation: 5.0,
            ),
          ),
          Card(
            elevation: 5.0,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: "Title",
                    ),
                    // onChanged: (String value) {
                    //   titleInput = value;
                    // },
                  ),
                  TextField(
                    controller: amountController,
                    decoration: const InputDecoration(
                      labelText: "Amount",
                    ),
                    // onChanged: (value) {
                    //   amountInput = value;
                    // },
                  ),
                  TextButton(
                      onPressed: () {
                        debugPrint(titleController.text);
                        debugPrint(amountController.text);
                      },
                      child: const Text("Add Transaction", style: TextStyle(color: Colors.purple),),
                  )
                ],
              ),
            ),
          ),
          Column(children: transaction.map((tx) {
            return Card(child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.purple,
                          width: 2.0
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "₹${tx.amount!}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.purple,
                      ),
                    )
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                      tx.title!,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                      DateFormat.yMMMd().format(tx.date!),
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],)
              ],
            ),);
          }).toList())
        ],
      ),
    );
  }
}

