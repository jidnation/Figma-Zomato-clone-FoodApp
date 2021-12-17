import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.rating,
    required this.price,
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
                              Text(title,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  )),
                              Text(subTitle,
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
                          const MaxDeliveryDesign()
                        ])
                      ]),
                )
              ]),
        )
      ]),
    );
  }
}

class MaxDeliveryDesign extends StatelessWidget {
  const MaxDeliveryDesign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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


class Source extends StatelessWidget {
  final String title;
  final String imgLocation;
  final double price;
  
  const Source({
    Key? key, required this.title, required this.imgLocation, required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 109,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade400)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Text(
                  title ,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '\$ $price',
                  style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                ),
                Row(children: [
                  Container(
                    width: 38,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      border: Border.all(color: Colors.red.shade300),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Center(
                      child: Text('Must Try',
                          style: TextStyle(
                              fontSize: 7,
                              fontWeight: FontWeight.w700,
                              color: Colors.red.shade700)),
                    ),
                  )
                ]),
                RichText(
                    text: TextSpan(
                        text: '[Veg Preparation] Spring mix.plant based\n',
                        style: TextStyle(
                            color: Colors.grey.shade400, fontSize: 11),
                        children: const [
                      TextSpan(text: 'organic...'),
                      TextSpan(
                          text: 'read more',
                          style: TextStyle(color: Colors.black)),
                    ]))
              ]),
          Stack(children: [
            Container(
              height: 100,
              padding: const EdgeInsets.only(bottom: 14),
              child: Container(
                  width: 92,
                  height: 89,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage( imgLocation ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey.shade200))),
            ),
            Positioned(
                bottom: 0,
                left: 12,
                child: Stack(children: [
                  Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text('ADD',
                            style: TextStyle(
                              color: Colors.red.shade800,
                              fontSize: 16,
                            )),
                      )),
                  Positioned(
                      top: 3,
                      right: 5,
                      child: FaIcon(
                        FontAwesomeIcons.plus,
                        size: 10,
                        color: Colors.red.shade900,
                      )),
                ]))
          ])
        ]),
      ),
    );
  }
}

class ToggleButton extends StatelessWidget {
  final String name;
  const ToggleButton({Key? key, required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Stack(children: [
        SizedBox(
          width: 38,
          height: 19,
          child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 2.5),
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(2),
              )),
        ),
        Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 19,
              height: 19,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.5, color: Colors.grey.shade500),
                  borderRadius: BorderRadius.circular(2)),
            )),
      ]),
      const SizedBox(width: 5),
      Text(name,
          style: TextStyle(
              color: Colors.grey.shade600, fontSize: 10, letterSpacing: 0.7))
    ]);
  }
}

class UpperBuild extends StatelessWidget {
  final String title;
  final String subTitle;
  final String svgLocation;

  const UpperBuild(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.svgLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.grey.shade300)),
          child: SvgPicture.asset(svgLocation)),
      const SizedBox(width: 5),
      RichText(
          text: TextSpan(
        text: '$title\n',
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
          letterSpacing: 1,
          fontWeight: FontWeight.w800,
        ),
        children: [
          TextSpan(text: subTitle, style: const TextStyle(color: Colors.black))
        ],
      ))
    ]);
  }
}
