import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/shared/models.dart';

class DropdownField extends FormField<String> {
  DropdownField({
    Key key,
    String initialValue,
    Map<String, MenuItem> itemMap,
    String hint,
    Function onSaved,
  }) : super(
          key: key,
          initialValue: initialValue,
          onSaved: onSaved,
          builder: (FormFieldState<String> field) {
            return Container(
              padding: EdgeInsets.only(top: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          value: field.value,
                          items: itemMap.keys.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    itemMap[item].title,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  itemMap[item].id != null
                                      ? Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 6.0),
                                          padding: EdgeInsets.all(6.0),
                                          child: Text(itemMap[item].id),
                                          decoration: BoxDecoration(
                                            color: Colors.blueAccent,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        )
                                      : Text(''),
                                ],
                              ),
                            );
                          }).toList(),
                          hint: Text(hint, style: TextStyle(fontSize: 20.0)),
                          onChanged: field.didChange,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    color: Colors.white,
                  )
                ],
              ),
            );
          },
        );
}
