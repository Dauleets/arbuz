import 'package:flutter/material.dart';
import 'package:flutter_application_2/misc/colors.dart';
import 'package:flutter_application_2/widget/categories.dart';
import 'package:flutter_application_2/widget/actions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
            child: Text(
              "Специальные коллекции",
              style: TextStyle(fontSize: 19.0),
            ),
          ),
          HomePage_Categories(),
          Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20.0),
              child: Text(
                "Акций",
                style: TextStyle(fontSize: 19.0),
              )),
          Additional_Collection()
        ],
      ),
    );
  }
}
