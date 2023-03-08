import 'dart:math';
import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.lightBlue[800],
      fontFamily: 'Inter',
    );

    return MaterialApp(
      home: const MyHomePage(),
      theme: tema.copyWith(
          colorScheme: tema.colorScheme.copyWith(
            primary: Colors.lightBlue,
            secondary: Colors.amber,
          ),
          textTheme: tema.textTheme.copyWith(
            headline6: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final transactions = [
    Transaction(
        id: 't1',
        title: 'Tennis Academia',
        value: 298.99,
        date: DateTime.now().subtract(const Duration(days: 3))),
    Transaction(
        id: 't2',
        title: 'Gasolina',
        value: 179.99,
        date: DateTime.now().subtract(const Duration(days: 4))),
  ];

  List<Transaction> get recentTransactions {
    return transactions
        .where(
          (transaction) => transaction.date.isAfter(
            DateTime.now().subtract(
              const Duration(days: 7),
            ),
          ),
        )
        .toList();
  }

  addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: ((_) {
          return TransactionForm(onSubmit: addTransaction);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton(
              onPressed: () => openTransactionFormModal(context),
              icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Chart(recentTransactions: recentTransactions),
            TransactionList(transactions: transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openTransactionFormModal(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
