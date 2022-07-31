import './Models/transaction.model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(home: MyHomePage(), title: "FLUTTER APP");
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'New shoes', amount: 20, date: DateTime.now()),
    Transaction(id: 't2', title: 'New Mobile', amount: 40, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expenses Application'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                child: Text("charts"),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ...transactions.map((trans) {
                  return Text(trans.title);
                }).toList()
              ],
            )
          ],
        ));
  }
}
