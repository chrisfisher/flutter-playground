import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class SwitchField extends FormField<bool> {
  SwitchField({
    Key key,
    bool initialValue,
    String title,
    Function onSaved,
  }) : super(
          key: key,
          initialValue: initialValue,
          onSaved: onSaved,
          builder: (FormFieldState<bool> field) {
            return Container(
              padding: EdgeInsets.only(top: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Switch(
                    value: field.value,
                    onChanged: field.didChange,
                  )
                ],
              ),
            );
          },
        );
}
