import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction>? transactions;

  const TransactionList({Key? key, @required this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: ListView.builder(
        itemCount: transactions!.length,
        itemBuilder: (BuildContext context, int index) {
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
                    "₹${transactions![index].amount}",
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
                    transactions![index].title!,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat.yMMMd().format(transactions![index].date!),
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],)
            ],
          ),);
        },
    ),);
  }
}
