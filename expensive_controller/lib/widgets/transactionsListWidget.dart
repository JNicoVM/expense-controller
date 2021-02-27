import 'dart:math';

import 'package:flutter/material.dart';

import '../models/transactionModel.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatefulWidget {
  final List<TransactionModel> transactionsList;
  final Function deleteTx;

  TransactionsList(this.transactionsList, this.deleteTx);

  @override
  _TransactionsListState createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
 Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple,
    ];

    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.transactionsList.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                Text(
                  "No transactions added yet!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.5,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (context, position) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: _bgColor,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text("\$${widget.transactionsList[position].amount}"),
                      ),
                    ),
                  ),
                  title: Text(
                    widget.transactionsList[position].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(widget.transactionsList[position].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? TextButton.icon(
                          onPressed: () =>
                              widget.deleteTx(widget.transactionsList[position].id),
                          icon: Icon(Icons.delete),
                          label: Text("Delete"),
                          style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(
                              TextStyle(color: Theme.of(context).errorColor),
                            ),
                          ),
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () =>
                              widget.deleteTx(widget.transactionsList[position].id),
                          color: Theme.of(context).errorColor),
                ),
              );
            },
            itemCount: widget.transactionsList.length,
          );
  }
}

// amount: transactionsList[position].amount.toString(),
//                   title: transactionsList[position].title,
//                   date: DateFormat.yMMMMd()
//                       .format(transactionsList[position].date),
//                 );
