import 'package:flutter/material.dart';
import 'package:flutter_application_2/misc/colors.dart';
import 'package:flutter_application_2/model/list_item.dart';
import 'package:flutter_application_2/widget/options.dart';

class Product_Screen extends StatelessWidget {
  final ListItem item;
  Product_Screen({Key? key, required this.item}) : super(key: key);
  

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(int.parse(item.color))),
      home: Scaffold(
        backgroundColor: Color(int.parse(item.color)),
        appBar: AppBar(
          backgroundColor: Color(int.parse(item.color)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: AppColors.whiteColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height < 600
                ? null
                : MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom -
                    56,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 620.0,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Text(
                          item.name,
                          style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor),
                        ),
                      ),
                      Center(
                        child: Hero(
                          tag: item.name,
                          child: Image(
                            image: AssetImage("assets/" + item.image),
                            height: 300.0,
                            width: 300.0,
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10,bottom: 5),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.price + "/кг",
                              style: TextStyle(
                                  fontSize: 25.0,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Wrap(
                                  children: List.generate(5, (index) {
                                    return Icon(Icons.star,
                                        color: index < 4
                                            ? AppColors.starColor
                                            : AppColors.textColor2);
                                  }),
                                ),
                                Text("(4.0)",
                                    style: TextStyle(
                                      color: AppColors.subtitleColor,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        child: Text(
                          item.description,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Text(
                          item.longDescription,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Center(
                //   child: Container(
                //       margin: const EdgeInsets.symmetric(vertical: 50),
                //       child: GestureDetector(
                //         onTap: () {

                //         },
                //         child: Container(
                //           height: 55,
                //           width: 200,
                //           decoration: BoxDecoration(
                //             color: AppColors.redArbuzColor,
                //             borderRadius: BorderRadius.circular(20),
                //           ),
                //           child: ListTile(
                //             title: Text(
                //               "Заказать",
                //               textAlign: TextAlign.center,
                //               style: TextStyle(
                //                 color: AppColors.whiteColor
                //               ),
                //             ),
                //           ),
                //         ),
                //       )),
                // )
                SizedBox(height: 10,),
                 Padding(
                   padding: const EdgeInsets.only(left: 20,top: 30,right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 50),
                    child: AppButtons(
                      size: 60, 
                      color: AppColors.textColor2, 
                      backgroundColor: AppColors.whiteColor, 
                      borderColor: AppColors.redArbuzColor,
                      isIcon: true,
                      icon: Icons.favorite_border
                    ),
                  ),
                  ResponsiveButton(
                    height: 60,
                    width: double.infinity,
                  )
                ],
              ),
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
