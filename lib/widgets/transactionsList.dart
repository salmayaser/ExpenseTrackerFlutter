import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Models/transaction.model.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionsList(this.transactions);

  @override
  Widget build(BuildContext ctx) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ...transactions.map((trans) {
          return (Card(
            child: Row(children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text('\$ ${trans.amount.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 20)),
                decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.purple)),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    trans.title,
                    style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    DateFormat().add_yMMMd().format(trans.date),
                    style: TextStyle(color: Colors.grey),
                  )
                ]),
              )
            ]),
          ));
        }).toList()
      ],
    );
  }
}
