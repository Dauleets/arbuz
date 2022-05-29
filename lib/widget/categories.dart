import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/misc/colors.dart';
import 'package:flutter_application_2/model/list_item.dart';
import 'package:flutter_application_2/screen/product_screen.dart';

class HomePage_Categories extends StatefulWidget {
  const HomePage_Categories({Key? key}) : super(key: key);

  @override
  _HomePage_CategoriesState createState() => _HomePage_CategoriesState();
}

class _HomePage_CategoriesState extends State<HomePage_Categories> {
  int _selectedIndex = 0;
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    this._controller.addListener(() {
      _selectCategoryIndex();
    });
    super.initState();
  }

  _selectCategoryIndex() {
    Timer(Duration(milliseconds: 100), () {
      var newIndex = _controller.offset / 210;
      if (newIndex.round() != _selectedIndex) {
        setState(() {
          _selectedIndex = newIndex.round();
        });
      }
    });
  }

  _scrollToTime(index) {
    double position = index * 210.0;
    _controller.animateTo(position,
        duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
  }

  Widget build(BuildContext context) {
    return Column(children: <Widget>[_listCategory(), _arbuzShow()]);
  }

  Widget _listCategory() {
    return Container(
      height: 45.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listItems.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
              _scrollToTime(_selectedIndex);
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: AppColors.blackColor,
                            width: 2.0,
                            style: _selectedIndex == index
                                ? BorderStyle.solid
                                : BorderStyle.none))),
                child: Text(
                  listItems[index].name,
                  style: TextStyle(
                    color: _selectedIndex == index
                        ? AppColors.blackColor
                        : AppColors.subtitleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.5,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _arbuzShow() {
    return Container(
      height: 360.0,
      margin: EdgeInsets.only(top: 20, left: 10.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        itemCount: listItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
            width: 210.0,
            decoration: BoxDecoration(
                color: Color(int.parse(listItems[index].color)),
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 30),
                      blurRadius: 10.0,
                      color: Color(int.parse(listItems[index].color))
                          .withOpacity(0.6),
                      spreadRadius: -20.0)
                ]),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        listItems[index].name,
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor),
                      ),
                      RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: listItems[index].price,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
                Hero(
                  tag: listItems[index].name,
                  child: Image(
                    image: AssetImage("assets/" + listItems[index].image),
                    width: 150.0,
                    height: 150.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: Text(
                    listItems[index].description,
                    style:
                        TextStyle(color: AppColors.whiteColor, fontSize: 12.0),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Product_Screen(
                                  item: listItems[index],
                                )));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: AppColors.blackColor.withOpacity(0.1),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "добавить в корзину",
                    style:
                        TextStyle(color: AppColors.whiteColor, fontSize: 12.0),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
