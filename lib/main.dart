import './Models/transaction.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                  return (Card(
                    child: Row(children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child:
                            Text('\$ ${trans.amount}', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 20)),
                        decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.purple)),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
            )
          ],
        ));
  }
}
