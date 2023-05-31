import 'package:date_time_flutter/view/add_user_view.dart';
import 'package:date_time_flutter/view/display_user_view.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Date and Time',
      initialRoute: '/addUser',
      routes: {
        '/addUser': (context) => const AddUserView(), 
        '/displayUser': (context) => const DisplayUserView(), 
      },
    );
  }
}