import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final Function _deleteTransaction;

  TransactionList(this._userTransactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      child: _userTransactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraint) {
                return Column(
                  children: <Widget>[
                    Text(
                      'No transactions...',
                      style: Theme.of(context).textTheme.title,
                    ),
                    Container(
                      height: constraint.maxHeight * 0.6,
                      margin: EdgeInsets.only(
                        top: 12,
                      ),
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              itemCount: _userTransactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 16,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4,
                    ),
                    child: ListTile(
                      leading: Padding(
                        padding: EdgeInsets.all(4),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: Theme.of(context).primaryColorDark,
                                width: 2,
                              )),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              '\$${_userTransactions[index].amount}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColorDark),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        _userTransactions[index].title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd()
                            .format(_userTransactions[index].date),
                      ),
                      // trailing: CircleAvatar(
                      //   radius: 30,
                      //   backgroundColor: Colors.deepPurple,
                      //   foregroundColor: Colors.white,
                      //   child:
                      trailing: MediaQuery.of(context).size.width > 460
                          ? FlatButton.icon(
                              icon: Icon(Icons.delete),
                              textColor: Theme.of(context).errorColor,
                              label: Text('Delete'),
                              onPressed: () => _deleteTransaction(
                                  _userTransactions[index].id),
                            )
                          : IconButton(
                              icon: Icon(Icons.delete),
                              color: Theme.of(context).errorColor,
                              onPressed: () => _deleteTransaction(
                                  _userTransactions[index].id),
                            ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
