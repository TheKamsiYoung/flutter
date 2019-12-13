import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/widgets/adaptive_raised_button.dart';

class NewTransaction extends StatefulWidget {
  final Function _addTransaction;

  NewTransaction(this._addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;
  final _selectedDateController = TextEditingController();

  void _submitData() {
    if (_amountController.text == null) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredAmount <= 0 || enteredTitle.isEmpty || _selectedDate == null) {
      return;
    }

    widget._addTransaction(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      builder: (BuildContext context, child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        } else {
          setState(() {
            _selectedDate = pickedDate;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          margin: EdgeInsets.only(
              left: 20,
              top: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.sentences,
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                // onChanged: (val) => titleInput = val,
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  onSubmitted: (_) => _submitData(),
                  decoration: InputDecoration(
                    labelText: 'Amount',
                  ),
                  // onChanged: (val) => amountInput = val,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              TextField(
                controller: _selectedDateController,
                decoration: InputDecoration(
                  labelText:
                      _selectedDate == null ? 'Choose a date...' : 'Date',
                  hintText: _selectedDate == null
                      ? null
                      : DateFormat.yMMMd().format(_selectedDate),
                ),
                onTap: _presentDatePicker,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                  child: AdaptiveRaisedButton('Add Transaction', _submitData)),
            ],
          ),
        ),
      ),
    );
  }
}
