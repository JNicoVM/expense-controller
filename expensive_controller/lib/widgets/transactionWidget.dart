import 'package:flutter/material.dart';

class TransactionWidget extends StatelessWidget {
  final String title;
  final String amount;
  final String date;

  TransactionWidget(
      {@required this.title, @required this.amount, @required this.date});

  String get price{
    return "\$$amount";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 2.2,
              ),
            ),
            child: Text(
              price,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
            padding: EdgeInsets.all(
              10,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                child: Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
