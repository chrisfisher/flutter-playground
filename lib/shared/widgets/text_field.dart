import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class TextInputField extends FormField<String> {
  TextInputField({
    Key key,
    String initialValue,
    String label,
    String hint,
    Function validator,
    Function onSaved,
    TextInputType keyboardType,
    bool autofocus = false,
    bool autocorrect = false,
  }) : super(
          builder: (FormFieldState<String> field) {
            return Container(
              padding: EdgeInsets.only(top: 12.0),
              child: TextFormField(
                key: key,
                initialValue: initialValue,
                autofocus: autofocus,
                autocorrect: autocorrect,
                keyboardType:
                    keyboardType != null ? keyboardType : TextInputType.text,
                decoration: InputDecoration(
                  hintText: hint,
                  labelText: label,
                ),
                validator: validator,
                onSaved: onSaved,
                style: TextStyle(fontSize: 20.0),
              ),
            );
          },
        );
}
