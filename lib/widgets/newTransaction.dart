import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  DateTime? dateCtrl;

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
          Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(dateCtrl == null ? 'Choose Date' : '${DateFormat().format(dateCtrl!)}'),
                  FlatButton(
                      onPressed: _openDatePicker,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                      ))
                ],
              )),
          ElevatedButton(
              onPressed: submit,
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.white,
                ),
              ))
        ]),
      ),
    );
  }

  void submit() {
    if (titleCtr.text.isEmpty || double.parse(amountCtr.text) < 0 || dateCtrl == null) {
      return;
    }
    widget.addNewTransaction(titleCtr.text, double.parse(amountCtr.text), dateCtrl);
    Navigator.of(context).pop();
  }

  void _openDatePicker() {
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2019), lastDate: DateTime.now()).then((value) {
      if (value == null) {
        return;
      } else {
        setState(() {
          dateCtrl = value;
        });
      }
    });
  }
}
