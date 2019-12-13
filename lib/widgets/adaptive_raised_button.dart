import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveRaisedButton extends StatelessWidget {
  final String text;
  final Function handler;

  AdaptiveRaisedButton(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Theme.of(context).primaryColorDark,
            onPressed: handler,
          )
        : RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Theme.of(context).primaryColorDark,
            textColor: Theme.of(context).textTheme.button.color,
            onPressed: handler,
          );
  }
}
