import 'package:expense/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Models/transaction.model.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String) deleteTransaction;
  TransactionsList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext ctx) {
    return transactions.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No Transactions added yet',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: 300,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ...transactions.map((trans) {
                return Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              child: FittedBox(child: Text('${trans.amount}')),
                            ),
                            title: Text(trans.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(ctx).primaryColor,
                                )),
                            subtitle: Text(DateFormat().format(trans.date)),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              color: Theme.of(ctx).primaryColor,
                              onPressed: () => {deleteTransaction(trans.id)},
                            ))));
              }).toList()
            ],
          );
  }
}
