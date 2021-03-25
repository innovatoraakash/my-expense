import 'package:flutter/material.dart';
// import 'user_transaction.dart';

class transactionForm extends StatelessWidget {
  final Function addTx;
  final titleControl = TextEditingController();
  final amountControl = TextEditingController();
  transactionForm(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: titleControl,
          decoration: InputDecoration(labelText: 'title'),
          keyboardType: TextInputType.text,
        ),
        TextField(
          decoration: InputDecoration(labelText: 'amount'),
          controller: amountControl,
          keyboardType: TextInputType.number,
        ),
        TextButton(
          onPressed: () => {
            if (titleControl.text != null || amountControl.text != null)
              {addTx(titleControl.text, double.parse(amountControl.text))}
          },
          child: Text('add'),
        )
      ],
    );
  }
}
