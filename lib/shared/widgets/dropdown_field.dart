import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class MenuItem {
  final String id;
  final String title;

  MenuItem({@required this.title, @required this.id});
}

class DropdownField extends FormField<MenuItem> {
  DropdownField({
    Key key,
    MenuItem initialValue,
    List<MenuItem> items,
    String hint,
    Function onSaved,
  }) : super(
          key: key,
          initialValue: initialValue != null
              ? items.firstWhere((item) => item.id == initialValue.id)
              : null,
          onSaved: onSaved,
          builder: (FormFieldState<MenuItem> field) {
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
                        child: DropdownButton<MenuItem>(
                          value: field.value,
                          items: items.map((MenuItem item) {
                            return DropdownMenuItem<MenuItem>(
                              value: item,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.title,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  item.id != null
                                      ? Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 6.0),
                                          padding: EdgeInsets.all(6.0),
                                          child: Text(item.id),
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
