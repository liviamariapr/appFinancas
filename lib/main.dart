
import 'package:flutter/material.dart';
import 'models/transaction.dart';
import './componets/transaction_form.dart';
import './componets/transaction_list.dart';
import 'models/transaction.dart';
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

  final _transactions =[
    Transaction(
      id: 't1',
      title: 'Novo Tenis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];
   addTransaction(String title,double value){
    final newTransaction = Transaction(
    id: Random().nextDouble().toString(),
    title: title,
    value: value,
    date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
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
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Gráfico'),
                elevation:10,
              ),
            ),
            TransactionList(_transactions),
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