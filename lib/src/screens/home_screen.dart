
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/transaction_model.dart';
import '../providers/transaction_provider.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<Transaction>(
      builder: (context,transaction,child){
        if(transaction.transactionList.isEmpty){
          return LinearProgressIndicator();
        }
        else{
          return _buildList(context, transaction.transactionList);
        }
      },
    );
  }

  _buildList(BuildContext context, List<TransactionModel> data ){
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index){
          TransactionModel current = data[index];
          return _buildItem(current);
        });
  }

  _buildItem(TransactionModel item){
    return Card(
      color: item.type == 'gasto' ? Colors.orange : Colors.green,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(item.title ?? ''),
            subtitle: Text(item.amount.toString()),
            trailing: Column(
              children: <Widget>[
                Text(item.description ?? ''),
                Text(item.category ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
    );
  }

}