import 'package:cmm_insight/locator.dart';
import 'package:cmm_insight/ui/router.dart' as router;
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CMM-Dashboard',
      theme: ThemeData(),
      initialRoute: router.initialRoute,
      onGenerateRoute: router.Router.generateRoute,
    );
  }
}
