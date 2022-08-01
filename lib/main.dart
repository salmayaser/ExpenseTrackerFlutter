import 'package:expense/widgets/newTransaction.dart';
import './widgets/transactionsList.dart';

import 'package:flutter/material.dart';

import 'Models/transaction.model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: MyHomePage(),
      title: "FLUTTER APP",
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'New shoes', amount: 20, date: DateTime.now()),
    Transaction(id: 't2', title: 'New Mobile', amount: 40, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Application'),
        actions: [
          IconButton(
              onPressed: () {
                startAddNewTransaction(ctx);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                child: Text("charts"),
              ),
            ),
            TransactionsList(transactions)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            startAddNewTransaction(ctx);
          }),
    );
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return NewTransaction(_addNewTransaction);
        });
  }

  _addNewTransaction(String title, double amount) {
    final newTrans = Transaction(id: 't${transactions.length}', title: title, amount: amount, date: DateTime.now());
    setState(() {
      transactions.add(newTrans);
    });
  }
}
