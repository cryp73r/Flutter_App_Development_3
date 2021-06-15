import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/transaction.dart';
import 'package:personal_expenses_app/widgets/new_transaction.dart';
import 'package:personal_expenses_app/widgets/transaction_list.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {

  final List<Transaction> _userTransactions = [
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

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(id: DateTime.now().toString(), title: title, amount: amount, date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addTx: _addNewTransaction,),
        TransactionList(transactions: _userTransactions,),
      ],
    );
  }
}
