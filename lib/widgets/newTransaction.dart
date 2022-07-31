import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleCtr = TextEditingController();
  final amountCtr = TextEditingController();
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  void submit() {
    if (titleCtr.text.isEmpty || double.parse(amountCtr.text) < 0) {
      return;
    }
    addNewTransaction(titleCtr.text, double.parse(amountCtr.text));
  }

  Widget build(BuildContext ctx) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleCtr,
            onSubmitted: (_) => {submit()},
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountCtr,
            onSubmitted: (_) => {submit()},
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          OutlinedButton(
              onPressed: submit,
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.purple),
              ))
        ]),
      ),
    );
  }
}
