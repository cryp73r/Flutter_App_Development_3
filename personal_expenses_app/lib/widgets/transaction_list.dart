import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction>? transactions;
  final Function deleteTx;

  const TransactionList({Key? key, required this.transactions, required this.deleteTx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions!.isEmpty?LayoutBuilder(builder: (ctx, constraints) {
      return Column(children: [
        Text("No Transaction added yet!",
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 20.0,),
        SizedBox(
            height: constraints.maxHeight * 0.59,
            child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,)),
      ],);
    })
    :ListView.builder(
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
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Theme.of(context).errorColor,),
              onPressed: () => deleteTx(transactions![index].id),
            ),
          ),
        );
      },
    );
  }
}
