import 'package:flutter/material.dart';
import 'package:flutter_application_2/misc/colors.dart';
import 'package:flutter_application_2/model/list_item.dart';
import 'package:flutter_application_2/screen/product_screen.dart';
import 'package:flutter_application_2/widget/options.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                "assets/banner1.png",
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      "Заполните форму",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 25.0,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(bottom: 20),
                    // color: AppColors.subtitleColor.withOpacity(0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButtonExample(),
                        SizedBox(height: 10),
                        Text(
                          "Вес:",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 18.0,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.bold),
                        ),

                        Slider_Status(),

                        Text(
                          "Количество:",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 18.0,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.bold),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        AmountButtuns(),

                        SizedBox(
                          height: 20,
                        ),

                        MySwitch(),

                        SizedBox(
                          height: 30,
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        DataItem(),

                        SizedBox(
                          height: 20,
                        ),

                        TwoDataItem(),

                        SizedBox(
                          height: 30
                        ),
                        Text(
                          "Заполните поле",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 18.0,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.bold),
                        ),

                        SizedBox(height: 10,),
                        MyCustomForm(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
