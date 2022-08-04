import 'package:expense/Models/transaction.model.dart';
import 'package:expense/widgets/chart-bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  double get totalAmount {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  List<Map> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {'Day': DateFormat.E().format(weekDay), 'amount': totalSum};
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext ctx) {
    print(groupedTransactionValues);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Row(children: [
        ...groupedTransactionValues.map((e) {
          return Flexible(fit: FlexFit.tight, child: ChartBar(e['Day'], e['amount'], (e['amount'] / totalAmount)));
        }).toList()
      ]),
    );
  }
}
