import 'package:flutter/material.dart';
import 'package:tuto/app.dart';
import 'package:provider/provider.dart';
import 'package:tuto/models/manage_todo.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ManageTodo(),
    child: const App(),
  ));
}
