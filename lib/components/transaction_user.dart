import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});
  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final transaction = [
    Transaction(
        id: 't1',
        title: 'Tennis Academia',
        value: 298.99,
        date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Gasolina', value: 179.99, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(transactions: transaction),
        TransactionForm(),
      ],
    );
  }
}
