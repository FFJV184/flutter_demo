import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

class Transaction extends ChangeNotifier{
  List<TransactionModel> _transactionList = [];
  List<TransactionModel> get transactionList => _transactionList;

  void addTransaction(TransactionModel newTransaction) {
    transactionList.add(newTransaction);
    notifyListeners();
  }
}