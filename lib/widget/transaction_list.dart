import 'dart:html';

import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'user_transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (ctx, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: transactions.map((txn) {
                return Card(
                  shadowColor: Colors.deepPurple,
                  color: Colors.pink.shade300,
                  elevation: 10,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade200,
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(10),
                                left: Radius.circular(6))),
                        child: Center(
                            child: Text(
                          txn.title,
                          style: TextStyle(fontSize: 17),
                        )),
                        padding: EdgeInsets.all(10),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'RS.' + txn.amount.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(txn.dateTime.toString())
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ));
  }
}
