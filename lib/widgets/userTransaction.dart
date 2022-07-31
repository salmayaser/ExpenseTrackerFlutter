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
      children: [NewTransaction(), TransactionsList(transactions)],
    );
  }
}
