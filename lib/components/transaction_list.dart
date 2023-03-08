import 'package:flutter/material.dart';
import 'package:expenses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key, required this.transactions});

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: ((context, index) {
          final transaction = transactions[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: FittedBox(
                    child: Text('R\$${transaction.value}'),
                  ),
                ),
              ),
              title: Text(
                transaction.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                DateFormat('d MMM y').format(transaction.date)
              ),
            ),
          );
        }),
      ),
    );
  }
}
