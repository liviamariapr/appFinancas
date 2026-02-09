import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget{
  
  final void Function(String,double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController= TextEditingController();

  final valueController = TextEditingController();

  _submitForm (){
      final title = titleController.text;
      final value =double.tryParse(valueController.text) ?? 0.0;
      
      if (title.isEmpty || value <=0){
        return ;
      }
      widget.onSubmit(title,value);
  }

  Widget build(BuildContext context){
    return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    onSubmitted: (_) => _submitForm(),
                    decoration: InputDecoration(
                      labelText: 'Título da Transação',
                    ),
                  ),
                  TextField(  
                    controller: valueController, 
                    keyboardType: TextInputType.number, 
                    onSubmitted: (_) => _submitForm(),
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
                    onPressed: _submitForm,
                  )
                ],
              ),
            ),
          );

  }
}