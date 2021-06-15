import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function? addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction({Key? key, @required this.addTx}) : super(key: key);

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
                addTx!(titleController.text, double.parse(amountController.text));
              },
              child: const Text("Add Transaction", style: TextStyle(color: Colors.purple),),
            )
          ],
        ),
      ),
    );
  }
}
