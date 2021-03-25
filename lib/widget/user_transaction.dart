import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'transaction_list.dart';
import 'transaction_form.dart';

class AddTransaction extends StatefulWidget {
  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final List<Transaction> userTransaction = [
    Transaction(
        id: 'p1',
        title: 'jutta dho',
        amount: 20.0,
        dateTime: NepaliDateFormat('yyyy/MMMM/dd (hh:mm a)')
            .format(NepaliDateTime.now())),
    Transaction(
        id: 'p2',
        title: 'rice',
        amount: 25.0,
        dateTime: NepaliDateFormat('yyyy/MMMM/dd (hh:mm a)')
            .format(NepaliDateTime.now()))
  ];

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: transactionForm(this.addtrx),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  final titleControl = TextEditingController();
  final amountControl = TextEditingController();
  void addtrx(String Title, double Amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: Title,
        amount: Amount,
        dateTime: NepaliDateFormat('yyyy/MMMM/dd (hh:mm a)')
            .format(NepaliDateTime.now()));

    setState(() {
      userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        transactionForm(this.addtrx),
        // Column(
        //   children: <Widget>[
        //     TextField(
        //       controller: titleControl,
        //       keyboardType: TextInputType.text,
        //     ),
        //     TextField(
        //       controller: amountControl,
        //       keyboardType: TextInputType.number,
        //     ),
        //     TextButton(
        //       onPressed: () => {
        //         if (titleControl.text != null || amountControl.text != null)
        //           {addtrx(titleControl.text, double.parse(amountControl.text))}
        //       },
        //       child: Text('add'),
        //     )
        //   ],
        // ),
        TransactionList(this.userTransaction),
      ],
    );
  }
}
