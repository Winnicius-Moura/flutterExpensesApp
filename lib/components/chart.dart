import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.recentTransactions});

  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDays = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++ ){
        bool sameDay = recentTransactions[i].date.day == weekDays.day;
        bool sameMonth = recentTransactions[i].date.month == weekDays.month;
        bool sameYear = recentTransactions[i].date.year == weekDays.year;
        
        if (sameDay && sameMonth && sameYear){
          totalSum += recentTransactions[i].value;
        }
      }

      print(DateFormat.E().format(weekDays)[0]);
      print(totalSum);
      
      return {
        'day': DateFormat.E().format(weekDays)[0],
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: const <Widget>[],
      ),
    );
  }
}
