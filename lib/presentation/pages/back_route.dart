import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BackRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back to homepage'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('back to homepage'),
            onPressed: () {
              Navigator.pop(context);
        }),
      ),
    );
  }

}