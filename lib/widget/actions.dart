import 'package:flutter/material.dart';
import 'package:flutter_application_2/screen/not_found_page.dart';

import '../misc/colors.dart';

class Additional_Collection extends StatelessWidget {
  const Additional_Collection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            FeaturePlantCard(
              image: "assets/banner2.jpg",
              title: "Арбуз — подарите себе сахарное лето",
            ),
            FeaturePlantCard(
              image: "assets/banner1.png",
              title: "Арбуз — подарите себе сахарное лето",
            ),
            FeaturePlantCard(
              image: "assets/banner1.jpg",
              title: "Арбуз — подарите себе сахарное лето",
            ),
          ],
        ),
      ),
    );
  }
}

class FeaturePlantCard extends StatelessWidget {
  const FeaturePlantCard({Key? key, required this.image, required this.title})
      : super(key: key);

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Not_Found_Screen()));
          },
          child: Container(
            margin: const EdgeInsets.only(
                left: 10.0,
                top: kDefaultPadding / 2,
                bottom: kDefaultPadding / 3),
            width: size.width * 0.8,
            height: 185,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(image))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            title,
            style: TextStyle(
                color: AppColors.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: 13.0),
          ),
        )
      ],
    );
  }
}
