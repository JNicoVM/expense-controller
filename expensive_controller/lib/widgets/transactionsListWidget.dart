import 'package:expensive_controller/models/transactionModel.dart';
import 'package:flutter/material.dart';

import '../models/transactionModel.dart';
import './transactionWidget.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  final List<TransactionModel> transactionsList;

  TransactionsList(this.transactionsList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, position) {
          return TransactionWidget(
            amount: transactionsList[position].amount.toString(),
            title: transactionsList[position].title,
            date: DateFormat.yMMMMd().format(transactionsList[position].date),
          );
        },
        itemCount: transactionsList.length,
      ),
    );
  }
}
