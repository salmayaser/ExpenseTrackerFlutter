import 'package:flutter/material.dart';
import '../Models/transaction.model.dart';
import './newTransaction.dart';
import './transactionsList.dart';

class UserTransaction extends StatefulWidget {
  @override
  createState() => _UserTransactionSate();
}

class _UserTransactionSate extends State<UserTransaction> {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'New shoes', amount: 20, date: DateTime.now()),
    Transaction(id: 't2', title: 'New Mobile', amount: 40, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext ctx) {
    return Column(
      children: [NewTransaction(_addNewTransaction), TransactionsList(transactions)],
    );
  }

  _addNewTransaction(String title, double amount) {
    final newTrans = Transaction(id: 't${transactions.length}', title: title, amount: amount, date: DateTime.now());
    setState(() {
      transactions.add(newTrans);
    });
  }
}
