
import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'package:intl/intl.dart';
main(){
  runApp(FinancasApp()); 
}
class FinancasApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      home: MyHomePage()
    );
  }

}
class MyHomePage extends StatelessWidget{
  final titleController= TextEditingController();
  final valueController = TextEditingController();
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
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'), 
      ),
      body: Column(
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
          Column(
            children: _transactions.map((tr) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width:2,
                        ),  
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'R\$ ${tr.value.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ), 
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tr.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:16,
                            color: Colors.purple,
                          )),
                        Text(
                          DateFormat('d MMM y').format(tr.date),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.grey,
                          ),),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Título da Transação',
                    ),
                  ),
                  TextField(
                    controller: valueController, 
                    decoration: InputDecoration(
                      labelText: 'Valor da Transação R\$ ',
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Adicionar nova Transação',
                      style: TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                    onPressed: (){ 
                      print(titleController.text);
                      print(valueController.text);
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
    

  }

}