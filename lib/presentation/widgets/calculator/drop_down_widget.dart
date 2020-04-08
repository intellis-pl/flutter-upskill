
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multilayerapp/domain/entities/finance_type.dart';

class DropDownWidget<T extends FinanceType> extends StatefulWidget {
  final T values;

  const DropDownWidget(this.values);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState(this.values);

}

class _DropDownWidgetState<T extends FinanceType> extends State<DropDownWidget> {
  final T values;
  var dropdownValue;

  _DropDownWidgetState(this.values);

  @override
  Widget build(BuildContext context) {
    dropdownValue = values.getValues()[0];
    return
      DropdownButton(
        value: dropdownValue,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 32,
        elevation: 16,
        style: TextStyle(
            color: Colors.deepPurple
        ),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: values.getValues().map<DropdownMenuItem>((value) {
         return DropdownMenuItem (
           value: value,
           child: Text(values.getName(value))
         );
        },
        ).toList()
    );
  }
}