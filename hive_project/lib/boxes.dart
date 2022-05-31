import 'package:hive/hive.dart';
import 'package:hive_project/model/transaction.dart';

class Boxes {
  static Box<Transaction> getTransactions() =>
  Hive.box('transaction');
}