import 'package:flutter/material.dart';
import 'package:flutter_playground/app.dart';
import 'package:flutter_playground/config.dart';

void main() {
  AppConfig.initWithConfig(
    apiBaseUrl: "http://logmate-prod.com/api/v1/",
  );

  runApp(LogmateApp());
}
