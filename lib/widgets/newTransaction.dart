import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewTransactionState();
  }

  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);
}

class _NewTransactionState extends State<NewTransaction> {
  final titleCtr = TextEditingController();
  final amountCtr = TextEditingController();

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
                style: TextStyle(color: Theme.of(ctx).primaryColor),
              ))
        ]),
      ),
    );
  }

  void submit() {
    if (titleCtr.text.isEmpty || double.parse(amountCtr.text) < 0) {
      return;
    }
    widget.addNewTransaction(titleCtr.text, double.parse(amountCtr.text));
    Navigator.of(context).pop();
  }
}
