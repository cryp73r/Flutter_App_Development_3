import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function? addTx;

  const NewTransaction({Key? key, @required this.addTx}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount<=0) {
      return;
    }
    widget.addTx!(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              autocorrect: false,
              decoration: const InputDecoration(
                labelText: "Title",
              ),
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              onPressed: submitData,
              child: const Text("Add Transaction", style: TextStyle(color: Colors.purple),),
            )
          ],
        ),
      ),
    );
  }
}
