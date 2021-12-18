import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zomato_foodapp_design_clone/Configurations/constant.dart';
import 'package:zomato_foodapp_design_clone/Configurations/general.dart';
import 'package:zomato_foodapp_design_clone/Routes/contacts.dart';
import 'package:zomato_foodapp_design_clone/Screens/Home/widgets.dart';
import 'package:zomato_foodapp_design_clone/Tools/data.dart';
import 'package:zomato_foodapp_design_clone/Tools/genrators.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class Data {}

class _HomePageBodyState extends State<HomePageBody> {
  final String dataLocation = 'assets/foodsData.json';

  Future<void> readJson() async {
    final String response = await rootBundle.loadString(dataLocation);
    final data = await json.decode(response);

    setState(() {
      foodsDetailList = data["items"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    // print(foodsDetailList);
    final List<TextStyle> container1 = [
      textStying(color: whiteColor, weight: FontWeight.w200, size: 12),
      textStying(color: whiteColor, weight: FontWeight.w700, size: 25),
      textStying(color: whiteColor, weight: FontWeight.bold, size: 20),
      textStying(color: whiteColor, weight: FontWeight.bold, size: 20),
    ];
    final List<TextStyle> container2 = [
      textStying(
          color: const Color(0xff0b4e9e), weight: FontWeight.bold, size: 20),
      textStying(
          color: const Color(0xff6a9acb), weight: FontWeight.w600, size: 18),
      textStying(color: Colors.black, weight: FontWeight.normal, size: 13),
      textStying(color: Colors.black, weight: FontWeight.normal, size: 13),
    ];
    SizeConfig().init(context);
    final int value = (SizeConfig.screenWidth * 0.5).toInt();
    return SafeArea(
      child: ListView(children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.defaultSize * 1.2,
              horizontal: SizeConfig.defaultSize),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Column(children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FaIcon(FontAwesomeIcons.mapMarkerAlt,
                        color: Colors.grey.shade700),
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.75,
                      height: SizeConfig.defaultSize,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value,
                        itemBuilder: (context, index) => const Text('-',
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                      ),
                    ),
                    FaIcon(FontAwesomeIcons.bars, color: Colors.grey.shade700)
                  ]),
              SizedBox(
                height: SizeConfig.defaultSize * 2,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.defaultSize,
                    vertical: SizeConfig.defaultSize * 0.2),
                height: SizeConfig.defaultSize * 4.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeConfig.defaultSize),
                  border: Border.all(color: Colors.grey.shade600, width: 1.5),
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.search,
                        color: Colors.red.shade300,
                        size: SizeConfig.defaultSize * 2.4,
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth * 0.75,
                        child: TextFormField(
                            scrollPadding: EdgeInsets.only(
                                top: SizeConfig.defaultSize * 0),
                            cursorColor: Colors.grey.shade600,
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: SizeConfig.defaultSize * 2,
                            ),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText:
                                    'Restaurant name, cuisine, or a dish...',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                ),
                                isDense: true,
                                border: InputBorder.none)),
                      )
                    ]),
              ),
              SizedBox(
                height: SizeConfig.defaultSize * 2,
              ),
              SizedBox(
                width: SizeConfig.screenWidth,
                height: SizeConfig.defaultSize * 4.3,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: text1.length,
                    itemBuilder: (context, index) => TabsGenerator(
                        text1: text1[index],
                        text2: text2[index],
                        right: right[index],
                        left: left[index])),
              ),
            ]),

            ///The second Section
            ///
            SizedBox(height: SizeConfig.defaultSize * 2),
            SizedBox(
              height: 130,
              width: SizeConfig.screenWidth,
              child: ListView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Poster(
                        text1: 'UP TO',
                        text2: '60% OFF',
                        text3: 'no cooking',
                        text4: 'JULY',
                        isUnderline: true,
                        arrowColor: whiteColor,
                        iconLocation: 'icons/girl.svg',
                        text1Style: container1[0],
                        text2Style: container1[1],
                        text3Style: container1[2],
                        text4Style: container1[3],
                        gradient: gradient1),
                    const SizedBox(width: 10),
                    Poster(
                        text1: 'billing',
                        text2: 'discounts',
                        text3: 'now on your favourite',
                        text4: 'resturants',
                        isPicture: true,
                        arrowColor: Colors.black,
                        iconLocation: 'icons/food.png',
                        text1Style: container2[0],
                        text2Style: container2[1],
                        text3Style: container2[2],
                        text4Style: container2[3],
                        gradient: gradient2),
                  ]),
            ),
            const SizedBox(height: 25),
            const Align(
              alignment: Alignment.topLeft,
              child: Text('Eat what makes you happy',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            ),
            const SizedBox(height: 20),
            const FoodShowCase(),
            SizedBox(
              height: SizeConfig.defaultSize * 2,
            ),
            Container(
              height: 26,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 0.5, color: Colors.grey.shade300),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('See more'),
                    SizedBox(width: 10),
                    FaIcon(FontAwesomeIcons.angleDown)
                  ]),
            ),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('396 restaurants around you',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 276 * foodsDetailList.length.toDouble(),
              width: SizeConfig.screenWidth,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: foodsDetailList.length,
                  itemBuilder: (context, index) {
                    // print(foodsDetailList);
                    if (foodsDetailList.isNotEmpty) {
                      var contain = foodsDetailList[index];
                      return Column(children: [
                        GestureDetector(
                          child: FoodDetailsList(
                              image: contain['image'],
                              title: contain['title'],
                              subTitle: contain['subTitle'],
                              rating: contain['rating'],
                              price: contain['price']),
                          onTap: () {
                            Navigator.pushNamed(context, foodDetailPage, arguments: contain);
                          },
                        ),
                        const SizedBox(height: 25),
                      ]);
                    }
                    return CircularProgressIndicator(
                        color: Colors.green.withOpacity(0.5));
                  }),
            ),
          ]),
        ),
      ]),
    );
  }
}
