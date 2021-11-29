import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zomato_foodapp_design_clone/Configurations/constant.dart';
import 'package:zomato_foodapp_design_clone/Tools/buttons.dart';
import 'package:zomato_foodapp_design_clone/Tools/data.dart';

class TabsGenerator extends StatelessWidget {
  const TabsGenerator({
    Key? key,
    required this.text1,
    this.text2,
    required this.right,
    required this.left,
  }) : super(key: key);

  final String text1;
  final String? text2;
  final Widget right;
  final Widget left;

  @override
  Widget build(BuildContext context) {
    return Tabs(text: text1, text2: text2, right: right, left: left);
  }
}

class Poster extends StatelessWidget {
  final String text1;
  final String text2;
  final bool? isUnderline;
  final String text3;
  final String text4;
  final bool? isPicture;
  final Color arrowColor;
  final String iconLocation;
  final TextStyle text1Style;
  final TextStyle text2Style;
  final TextStyle text3Style;
  final TextStyle text4Style;
  final LinearGradient gradient;
  const Poster({
    Key? key,
    required this.text1,
    required this.text2,
    this.isUnderline = false,
    required this.text3,
    required this.text4,
    required this.arrowColor,
    required this.iconLocation,
    required this.text1Style,
    required this.text2Style,
    required this.text3Style,
    required this.text4Style,
    required this.gradient,
    this.isPicture = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget containerSetter = (isUnderline!)
        ? Container(width: 30, height: 1, color: whiteColor)
        : Container();

    final Widget iconSetter = (isPicture!)
        ? Image(image: AssetImage(iconLocation))
        : SvgPicture.asset(iconLocation, height: 65);
    return Container(
      padding: EdgeInsets.only(
        left: SizeConfig.defaultSize * 1.2,
        top: SizeConfig.defaultSize * 1.4,
        bottom: SizeConfig.defaultSize * 0.4,
      ),
      width: 180,
      height: 125,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text1, style: text1Style),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  text2,
                  style: text2Style,
                ),
                containerSetter
              ]),
              const SizedBox(height: 5),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  text3,
                  style: text3Style,
                ),
                const SizedBox(height: 5),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    text4,
                    style: text4Style,
                  ),
                  const SizedBox(width: 10),
                  const FaIcon(FontAwesomeIcons.arrowCircleRight,
                      size: 12, color: whiteColor),
                ]),
              ]),
            ]),
        Column(mainAxisAlignment: MainAxisAlignment.end, children: [iconSetter])
      ]),
    );
  }
}

class FoodShowCase extends StatelessWidget {
  const FoodShowCase({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: SizeConfig.screenWidth,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 15,
            crossAxisCount: 4,
          ),
          itemCount: foodMenu.length,
          itemBuilder: (context, index) {
            return Column(children: [
              Flexible(
                child: CircleAvatar(
                    backgroundImage: AssetImage(foodMenu[index][0]),
                    radius: 45),
              ),
              Text(foodMenu[index][1])
            ]);
          }),
    );
  }
}


///Don't Know how to use yet
// class FoodsData {
//   String image;
//   String title;
//   String subTitle;
//   double rating;
//   int price;

//   FoodsData(
//       {required this.image,
//       required this.title,
//       required this.subTitle,
//       required this.rating,
//       required this.price});

//   factory FoodsData.fromJson(Map<String, dynamic> json) {
//     return FoodsData(
//       image: json['image'],
//       title: json['title'],
//       subTitle: json['subTitle'],
//       rating: json['rating'],
//       price: json['price'],
//     );
//   }
// }

// class FoodsDataList {
//   final List<FoodsData> foodDataList;

//   FoodsDataList({required this.foodDataList});

//   factory FoodsDataList.fromJson(List<dynamic> parseJson) {
//     List<FoodsData> foodsDataL;

//     foodsDataL = parseJson.map((i) => FoodsData.fromJson(i)).toList();

//     return FoodsDataList(foodDataList: foodsDataL);
//   }
// }
