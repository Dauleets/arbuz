import 'package:flutter/material.dart';
import 'package:flutter_application_2/misc/colors.dart';
import 'package:flutter_application_2/screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Arbuz',
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.redArbuzColor,
                      ))), // Here Im having the error
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
