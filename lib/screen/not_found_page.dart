import 'package:flutter/material.dart';
import 'package:flutter_application_2/misc/colors.dart';

class Not_Found_Screen extends StatelessWidget {
  const Not_Found_Screen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Container(
          color: AppColors.whiteColor,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\404\nnot found",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: AppColors.blackColor.withOpacity(0.2)
                  ),
                ),
                SizedBox(height: 40.0),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Text(
                      "Назад",
                      style: TextStyle(
                        color: AppColors.blackColor.withOpacity(1),
                        fontSize: 20.0,
                        
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      );
  }
}