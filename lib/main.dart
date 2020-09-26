import 'package:flutter/material.dart';
import 'package:notepad/models/UserInformation.dart';
import 'package:notepad/routes.dart';
import 'package:notepad/tabs/HomePageTab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    UserInformation().createDummyData();

    ///sita veliau istrinti
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Notepad (name subject to change)'),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}

