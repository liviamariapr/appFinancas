import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget{
  
  final void Function(String,double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController= TextEditingController();

  final valueController = TextEditingController();

  DateTime? _selectedDate;
  _submitForm (){
      final title = titleController.text;
      final value =double.tryParse(valueController.text) ?? 0.0;

      if (title.isEmpty || value <=0 || _selectedDate == null){
        return ;
      }
      widget.onSubmit(title,value,_selectedDate!);
  }
_showDatePicker(){
  showDatePicker(
    context:context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2025),
    lastDate: DateTime.now(),
  ).then((pickedDate){
    if(pickedDate == null){
      return ;
    }
    setState((){
          _selectedDate = pickedDate;
    });
  

  });

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
                  Container(
                    height:70,
                    child: Row(
                      children: <Widget>[
                        Text(
                          _selectedDate ==null
                          ? 'Nenhuma data selecionada!'
                          : DateFormat('d/M/y').format(_selectedDate!),
                          ),
                        TextButton(
                        
                          child: Text('Selecionar Data ',
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          )),
                          onPressed: _showDatePicker,                      
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    child: Text(
                      'Nova Transação',
                      style: TextStyle(
                        color: Colors.white,
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