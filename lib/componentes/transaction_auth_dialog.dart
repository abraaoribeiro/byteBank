import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {
  final Function(String password) onConfirm;

  const TransactionAuthDialog({Key key, this.onConfirm}) : super(key: key);

  @override
  _TransactionAuthDialogState createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: Text('Autheticate'),
        content: TextField(
          controller: _passwordController,
          obscureText: true,
          maxLength: 4,
          textAlign: TextAlign.center,
          decoration: InputDecoration(border: OutlineInputBorder()),
          style: TextStyle(fontSize: 64, letterSpacing: 24),
          keyboardType: TextInputType.number,
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
                  Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          FlatButton(
            onPressed: () {
              widget.onConfirm(_passwordController.text);
              Navigator.pop(context);
            },
            child: Text("Confirm"),
          ),
        ],
      ),
    );
  }
}