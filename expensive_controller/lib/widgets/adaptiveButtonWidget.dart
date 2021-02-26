import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveButtonWiget extends StatelessWidget {
  final String text;
  final Function handler;

  AdaptiveButtonWiget(this.handler, this.text);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
                        ? CupertinoButton(
                            onPressed: handler,
                            child: Text(
                              "Choose Date",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : TextButton(
                            onPressed: handler,
                            child: Text(
                              "Choose Date",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
  }
}