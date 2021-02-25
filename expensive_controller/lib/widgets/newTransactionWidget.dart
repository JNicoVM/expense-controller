import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTxHandlers;

  NewTransaction(this.addTxHandlers);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitTransaction() {
    var enteredAmount = 0.0;
    final enteredTitle = titleController.text;
    if (amountController.text.isNotEmpty) {
      enteredAmount = double.parse(amountController.text);
    }

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTxHandlers(
      titleController.text,
      double.parse(amountController.text),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Tittle"),
              controller: titleController,
               onSubmitted: (_) => submitTransaction(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitTransaction(),
            ),
            TextButton(
              onPressed: submitTransaction,
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
