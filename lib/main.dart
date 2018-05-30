import 'package:flutter/material.dart';
import 'package:flutter_playground/app.dart';
import 'package:flutter_playground/config.dart';

void main() {
  AppConfig.initWithConfig(
    apiBaseUrl: "http://localhost:8081/api/v1/",
  );

  runApp(LogmateApp());
}
