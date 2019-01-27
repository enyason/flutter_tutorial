import 'package:flutter/material.dart';

class ListDialog extends StatefulWidget {
  @override
  _ListDialogState createState() => _ListDialogState();
}

class _ListDialogState extends State<ListDialog> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Center(
          child: Text("Emmanuel"),
        ),
        Center(
          child: Text("Ideba "),
        ),
        Center(
          child: Text("Enya"),
        ),
        Center(
          child: Text("enyasonjnr@gmail.com"),
        ),
      ],
    );
  }
}
