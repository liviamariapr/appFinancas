
import 'package:flutter/material.dart';
import 'models/transaction.dart';
import './componets/transaction_form.dart';
import './componets/transaction_list.dart';
import 'models/transaction.dart';
import 'componets/chart.dart';
import 'dart:math';
main(){
  runApp(FinancasApp()); 
}
class FinancasApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        useMaterial3:false,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          primary: Colors.purple,
          secondary: Colors.amber,  
        ),
        fontFamily: 'Quicksand',
        ),
      );
  }

}
class MyHomePage extends StatefulWidget{
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _transactions =[
    
  ];
   addTransaction(String title,double value, DateTime date){
    final newTransaction = Transaction(
    id: Random().nextDouble().toString(),
    title: title,
    value: value,
    date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

_deleteTransaction(String id){
  setState(() {
  _transactions.removeWhere((tr){
    return tr.id == id;
  });
  });
}

List<Transaction> get _recentTransactions{
  return _transactions.where((tr){
    return tr.date.isAfter(DateTime.now().subtract(
      Duration(days: 7),
    ));
  }).toList();
}

_opentransactionFormModal(BuildContext context){
  showModalBottomSheet(
    context: context,
    builder: (_){
      return  TransactionForm(addTransaction);
    }
  );
}

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Despesas Pessoais',
        ), 
        actions: <Widget>[
          IconButton (
            icon: Icon(Icons.add),
            onPressed: () => _opentransactionFormModal(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_transactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _opentransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
    

  }
}