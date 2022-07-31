import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleCtr = TextEditingController();
  final amountCtr = TextEditingController();
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  Widget build(BuildContext ctx) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleCtr,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountCtr,
          ),
          OutlinedButton(
              onPressed: () {
                addNewTransaction(titleCtr.text, double.parse(amountCtr.text));
              },
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.purple),
              ))
        ]),
      ),
    );
  }
}
