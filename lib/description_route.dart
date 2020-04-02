import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DescriptionRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: RaisedButton(
          child: Text('go to'),
          onPressed: () {
            Navigator.pushNamed(context, '/description');
          },
        ),
      );
  }

}