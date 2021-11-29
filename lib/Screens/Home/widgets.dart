import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zomato_foodapp_design_clone/Configurations/constant.dart';
import 'package:zomato_foodapp_design_clone/Tools/data.dart';

class FoodDetailsList extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final num rating;
  final num price;
  const FoodDetailsList({
    Key? key, required this.image, required this.title, required this.subTitle, required this.rating, required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 251,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                offset: const Offset(0, 2),
                blurRadius: 0.1),
                BoxShadow(
                color: Colors.grey.shade400,
                offset: const Offset(1, 0),
                blurRadius: 0.4),
                BoxShadow(
                color: Colors.grey.shade400,
                offset: const Offset(-1, 0),
                blurRadius: 0.4),
          ]),
      child: Column(children: [
        Container(
          height: 166,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(5),
                topLeft: Radius.circular(5),
              ),
              color: Colors.grey.shade700,
              image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 85,
          width: SizeConfig.screenWidth,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 8, right: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text( title,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              )),
                          Text( subTitle,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              )),
                        ]),
                        Column(children: [
                          Container(
                            height: 21,
                            width: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xff2b7d0f),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(rating.toString(),
                                      style: const TextStyle(
                                          color: whiteColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                  const SizedBox(width: 4),
                                  const FaIcon(FontAwesomeIcons.solidStar,
                                      size: 8, color: whiteColor)
                                ]),
                          ),
                          Text('${price.toString()} for one',
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                              ))
                        ]),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8, left: 2),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: const [
                          Image(image: AssetImage('images/greenLeaf.png')),
                          SizedBox(width: 2),
                          Text(
                              'Zomato funds environmental projects to offset\noffset delivery carbon footprint',
                              style: TextStyle(
                                  fontSize: 10.5, fontWeight: FontWeight.w500)),
                        ]),
                        Row(children: [
                          Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              color: const Color(0xff4e1f43),
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage('images/zArrow.png')),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                              height: 26,
                              width: 66,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xff196b44)),
                              child: Column(children: [
                                Container(
                                    height: 13,
                                    width: 66,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        topLeft: Radius.circular(5),
                                      ),
                                      color: Color(0xffedd925),
                                    ),
                                    child: const Center(
                                      child: Text('MAX SAFETY',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400)),
                                    )),
                                const SizedBox(
                                  height: 13,
                                  width: 66,
                                  child: Center(
                                    child: Text('DELIVERY',
                                        style: TextStyle(
                                            color: whiteColor,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                )
                              ]))
                        ])
                      ]),
                )
              ]),
        )
      ]),
    );
  }
}

class FoodsDetailList extends StatelessWidget {
  const FoodsDetailList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                FoodDetailsList(
                    image: contain['image'],
                    title: contain['title'],
                    subTitle: contain['subTitle'],
                    rating: contain['rating'],
                    price: contain['price']),
                const SizedBox(height: 25),
              ]);
            }
            return CircularProgressIndicator(
                color: Colors.green.withOpacity(0.5));
          }),
    );
  }
}
