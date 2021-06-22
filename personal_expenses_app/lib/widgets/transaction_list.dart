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
      child: transactions!.isEmpty?Column(children: [
        Text("No Transaction added yet!",
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 20.0,),
        SizedBox(
          height: 200.0,
            child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,)),
      ],):ListView.builder(
        itemCount: transactions!.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 5.0,
            ),
            elevation: 5.0,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                    child: FittedBox(child: Text("₹${transactions![index].amount!.toStringAsFixed(2)}"))
                ),
              ),
              title: Text(
                transactions![index].title!,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(
                DateFormat.yMMMd().format(transactions![index].date!),
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          );
            // Card(child: Row(
            //   children: [
            //     Container(
            //         margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //         decoration: BoxDecoration(
            //           border: Border.all(
            //               color: Theme.of(context).primaryColor,
            //               width: 2.0
            //           ),
            //         ),
            //         padding: const EdgeInsets.all(10.0),
            //         child: Text(
            //           "₹${transactions![index].amount!.toStringAsFixed(2)}",
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontSize: 20.0,
            //             color: Theme.of(context).primaryColor,
            //           ),
            //         )
            //     ),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //
            //         ),
            //
            //       ],)
            //   ],
            // ),);
        },
    ),);
  }
}
