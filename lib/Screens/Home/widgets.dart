import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400)),
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

class Source extends StatefulWidget {
  final String title;
  final String imgLocation;
  final double price;

  const Source({
    Key? key,
    required this.title,
    required this.imgLocation,
    required this.price,
  }) : super(key: key);

  @override
  State<Source> createState() => _SourceState();
}

class _SourceState extends State<Source> {
  bool? sel = false;
  bool? sel1 = false;
  bool? sel2 = false;
  bool? sel3 = false;
  bool? sel4 = false;
  bool? sel5 = false;
  bool? sel6 = false;
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
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '\$ ${widget.price}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w300, fontSize: 13),
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
                          image: AssetImage(widget.imgLocation),
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

class Addons extends StatelessWidget {
  final bool? sel;
  final String title;
  final double price;
  const Addons(
      {Key? key, required this.sel, required this.title, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
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
      const SizedBox(width: 10),
      Text(title, style: TextStyle(color: Colors.grey.shade700)),
      const Spacer(),
      Text('\$$price', style: TextStyle(color: Colors.grey.shade700)),
      const SizedBox(width: 10),
      Checker(name: sel)
    ]);
  }
}

class Checker extends StatelessWidget {
  bool? name;
  Checker({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, updater) => SizedBox(
        width: 15,
        child: Checkbox(
            checkColor: Colors.white,
            activeColor: Colors.green,
            value: name,
            //TODO to start with the state function of the checkbox
            onChanged: (bool? value) => updater(() {
                  name = value;
                })),
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

// TAB-VIEWS TAB
class DinningTab extends StatefulWidget {
  const DinningTab({Key? key}) : super(key: key);

  @override
  State<DinningTab> createState() => _DinningTabState();
}

class _DinningTabState extends State<DinningTab> {
  bool? sel = false;
  bool? sel1 = false;
  bool? sel2 = false;
  bool? sel3 = false;
  bool? sel4 = false;
  bool? sel5 = false;
  bool? sel6 = false;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Plant Protein Bowl',
              style: TextStyle(color: Colors.grey.shade900)),
          const SizedBox(height: 10),
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
          const SizedBox(height: 10),
          RichText(
              text: TextSpan(
                  text: '[Veg Preparation] Spring mix.plant based\n',
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 11),
                  children: const [
                TextSpan(text: 'organic...'),
                TextSpan(
                    text: 'read more', style: TextStyle(color: Colors.black)),
              ])),
        ]),
      ),
      const SizedBox(height: 2),
      Divider(thickness: 2, color: Colors.grey.shade400),
      const SizedBox(height: 10),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Add On',
            style: TextStyle(fontSize: 18),
          ),
          Text('You can choose up to 4 options',
              style: TextStyle(color: Colors.grey.shade600)),
          const SizedBox(height: 20),
          Addons(sel: sel, title: 'Pesto Paneer', price: 40),
          const SizedBox(height: 10),
          Addons(sel: sel1, title: 'Paneer', price: 40),
          const SizedBox(height: 10),
          Addons(sel: sel2, title: 'Extra Veggies', price: 40),
          const SizedBox(height: 10),
          Addons(sel: sel3, title: 'Mushroom', price: 40),
          const SizedBox(height: 10),
          Addons(sel: sel4, title: 'Corn', price: 40),
          const SizedBox(height: 10),
          Addons(sel: sel5, title: 'Chilli Paneer', price: 40),
          const SizedBox(height: 10),
          RichText(
              text: TextSpan(
                  text: 'Choose Your Protein\n',
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                TextSpan(
                    text: 'You can choose up to 3 options.',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 12))
              ])),
          const SizedBox(height: 10),
          Addons(sel: sel6, title: 'BBQ Protien', price: 40),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              width: SizeConfig.screenWidth * 0.23,
              height: 40,
              decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border.all(color: Colors.red.shade200),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.minus,
                          color: Colors.red.shade300, size: 12),
                      const Text('1',
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                      FaIcon(FontAwesomeIcons.plus,
                          color: Colors.red.shade300, size: 12)
                    ]),
              ),
            ),
            InkWell(
                onTap: () {
                  showModalBottomSheet<dynamic>(
                      isDismissible: false,
                      barrierColor: Colors.black.withOpacity(0.4),
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext bc) {
                        return Stack(children: [
                          Container(
                            height: SizeConfig.screenHeight * 0.9,
                            color: Colors.white.withOpacity(0.2),
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 20),
                              margin: EdgeInsets.only(
                                  top: SizeConfig.screenHeight * 0.1),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(25),
                                    topLeft: Radius.circular(25)),
                              ),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 180,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        image: const DecorationImage(
                                            image:
                                                AssetImage('images/add1.png'),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            width:
                                                SizeConfig.screenWidth * 0.23,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: whiteColor,
                                                border: Border.all(
                                                    color: Colors.red.shade200),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    FaIcon(
                                                        FontAwesomeIcons.minus,
                                                        color:
                                                            Colors.red.shade300,
                                                        size: 12),
                                                    const Text('1',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16)),
                                                    FaIcon(
                                                        FontAwesomeIcons.plus,
                                                        color:
                                                            Colors.red.shade300,
                                                        size: 12)
                                                  ]),
                                            ),
                                          ),
                                          Container(
                                              width:
                                                  SizeConfig.screenWidth * 0.67,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffcb202d),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: const Center(
                                                child: Text('Add \$199',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18)),
                                              ))
                                        ])
                                  ]),
                            ),
                          ),
                          Positioned(
                              top: 13,
                              left: SizeConfig.screenWidth * 0.43,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(17.5),
                                      color: Colors.black),
                                  child: const Center(
                                      child: FaIcon(FontAwesomeIcons.times,
                                          color: Colors.white)),
                                ),
                              ))
                        ]);
                      });
                },
                child: Container(
                    width: SizeConfig.screenWidth * 0.67,
                    height: 40,
                    decoration: BoxDecoration(
                        color: const Color(0xffcb202d),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text('Add \$199',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    )))
          ]),
        ]),
      ),
    ]);
  }
}

class DeliveryTab extends StatefulWidget {
  DeliveryTab({
    Key? key,
    required this.lastMember,
  }) : super(key: key);

  var lastMember;

  @override
  State<DeliveryTab> createState() => _DeliveryTabState();
}

class _DeliveryTabState extends State<DeliveryTab> {
  bool? covidCheck = false;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Stack(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: const [
          UpperBuild(
            svgLocation: 'icons/bike.svg',
            title: 'MODE',
            subTitle: 'delivery',
          ),
          UpperBuild(
              title: 'TIME',
              subTitle: '40 mins',
              svgLocation: 'icons/clock.svg'),
          UpperBuild(
              title: 'OFFERS',
              subTitle: 'view all(3)',
              svgLocation: 'icons/Offer.svg'),
          SizedBox(width: 5)
        ]),
        const Positioned(
            top: -3,
            right: 45,
            child: FaIcon(FontAwesomeIcons.caretDown, size: 18))
      ]),
      const SizedBox(height: 20),
      Container(
        width: SizeConfig.screenWidth,
        height: 26,
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 2),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(6)),
        child: Row(children: [
          const SizedBox(width: 10),
          SvgPicture.asset('icons/deliveryBike.svg'),
          const SizedBox(width: 10),
          const Text('\$25 distance charge')
        ]),
      ),
      const SizedBox(height: 15),
      Container(
        width: SizeConfig.screenWidth,
        height: 51,
        color: Colors.grey.shade300,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text('FULL Menu',
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                padding: const EdgeInsets.only(bottom: 15, top: 19),
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Colors.red, width: 2),
                )),
                child:
                    Text('${widget.lastMember[widget.lastMember.length - 1]}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        )),
              )
            ]),
      ),
      const SizedBox(height: 20),
      Row(children: [
        const Spacer(flex: 1),
        const ToggleButton(name: 'Veg'),
        const Spacer(flex: 1),
        const ToggleButton(name: 'Egg'),
        const Spacer(flex: 2),
        Container(
          width: 127,
          height: 37,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(5)),
          child: Row(children: [
            FaIcon(FontAwesomeIcons.search,
                color: Colors.red.shade300, size: 19),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: SizedBox(
                  width: 80,
                  child: TextFormField(
                    scrollPadding: const EdgeInsets.all(10),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          letterSpacing: 1,
                          fontSize: 19,
                          fontWeight: FontWeight.w500),
                      isDense: true,
                    ),
                  )),
            )
          ]),
        ),
        const Spacer(flex: 1)
      ]),
      const SizedBox(height: 15),
      Divider(
        thickness: 1,
        color: Colors.grey.shade400,
      ),
      const SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Recommended', style: TextStyle(color: Colors.grey.shade700)),
          const FaIcon(FontAwesomeIcons.caretUp)
        ]),
      ),
      const SizedBox(height: 20),
      const Source(
          title: 'Plant Protein Bowl',
          //TODO star Rating
          price: 220,
          imgLocation: 'images/add1.png'),
      const SizedBox(height: 20),
      const Source(
          title: 'Spring Veg Plater',
          price: 350,
          imgLocation: 'images/add2.png'),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Align(
          alignment: Alignment.bottomRight,
          child: InkWell(
            onTap: () {
              placeOrderScreen(context);
            },
            child: Container(
              height: 29,
              width: 89,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.black,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    FaIcon(FontAwesomeIcons.bars, color: whiteColor, size: 15),
                    SizedBox(width: 5),
                    Text('Menu',
                        style: TextStyle(color: whiteColor, fontSize: 17))
                  ]),
            ),
          ),
        ),
      ),
      const SizedBox(height: 10),
      Container(
          height: 51,
          padding: const EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade200)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              width: 139,
              height: 17,
              decoration: BoxDecoration(
                  color: const Color(0xff1a30f3),
                  borderRadius: BorderRadius.circular(5)),
              child: const Center(
                child: Text('30% OFF up to \$75',
                    style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 15)),
              ),
            ),
            const Text(
                'Use code ZOMSAFETY on orders with items\nworth \$159 or more',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 10,
                ))
          ]))
    ]);
  }

  Future<dynamic> placeOrderScreen(BuildContext context) {
    return showModalBottomSheet<dynamic>(
        isDismissible: false,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return Stack(children: [
            Container(
                height: SizeConfig.screenHeight * 0.9,
                color: Colors.transparent,
                child: Container(
                  margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.1),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      color: Colors.white),
                  child: ListView(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(children: [
                        Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset('icons/location.svg',
                                  width: 14, height: 14),
                              const SizedBox(width: 3),
                              const Flexible(
                                child: Text(
                                    'Delivery at Home - Flat no: 301, SVR Enclave, Hyper Nagar,vasavi',
                                    style: TextStyle(
                                      fontSize: 13,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                              ),
                              const SizedBox(width: 5),
                              FaIcon(FontAwesomeIcons.chevronDown,
                                  size: 10, color: Colors.grey.shade400)
                            ]),
                        const SizedBox(height: 12),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset('icons/time.svg'),
                              const SizedBox(width: 3),
                              const Text('Delivery in 42 mins'),
                            ]),
                        const SizedBox(height: 12),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(2),
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.grey.shade400)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  )),
                              const SizedBox(width: 3),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Plant Protein Bowl',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500)),
                                    const SizedBox(height: 10),
                                    const Text('\$279'),
                                    const SizedBox(height: 14),
                                    Text('Add On: Mushroom',
                                        style: TextStyle(
                                            color: Colors.grey.shade600))
                                  ]),
                              const Spacer(),
                              Column(children: [
                                Container(
                                  width: SizeConfig.screenWidth * 0.23,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      border: Border.all(
                                          color: Colors.red.shade200),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          FaIcon(FontAwesomeIcons.minus,
                                              color: Colors.red.shade300,
                                              size: 12),
                                          const Text('1',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600)),
                                          FaIcon(FontAwesomeIcons.plus,
                                              color: Colors.red.shade300,
                                              size: 12)
                                        ]),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text('\$279')
                              ])
                            ]),
                        const SizedBox(height: 30),
                        Center(
                            child: Text('Add cooking instructions (optional)',
                                style: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 18)))
                      ]),
                    ),
                    Divider(thickness: 1.5, color: Colors.grey.shade400),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Offers',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 20)),
                            const SizedBox(height: 7),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Row(children: [
                                SvgPicture.asset('icons/offers.svg',
                                    width: 22, height: 22),
                                const SizedBox(width: 7),
                                Flexible(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('Select a promo code'),
                                              const SizedBox(height: 8),
                                              Text(
                                                  'save \$59.70 with code ZOMSAFETY',
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade500,
                                                      fontSize: 11))
                                            ]),
                                        // const Spacer(),
                                        Text('View offers',
                                            style: TextStyle(
                                                color: Colors.red.shade400,
                                                fontSize: 13))
                                      ]),
                                )
                              ]),
                            ),
                            Divider(
                                thickness: 1.5, color: Colors.grey.shade400),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Please tip your  valet',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 16)),
                                      const SizedBox(height: 10),
                                      Text(
                                          'support your valet and make their day! 100%nof your tip will be transfer to your wallet',
                                          style: TextStyle(
                                              overflow: TextOverflow.clip,
                                              color: Colors.grey.shade500))
                                    ]))
                          ]),
                    ),
                    Divider(thickness: 1.5, color: Colors.grey.shade400),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TipValet(
                                iconPath: 'icons/soda.svg', price: 20),
                            const MTValet(),
                            const TipValet(
                                iconPath: 'icons/pizza.svg', price: 50),
                            Container(
                              width: 90,
                              height: 40,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade400)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SvgPicture.asset('icons/gift.svg',
                                        height: 20, width: 20),
                                    Text('Customer')
                                  ]),
                            )
                          ],
                        )),
                    Divider(thickness: 1.5, color: Colors.grey.shade400),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 8, top: 10, bottom: 13),
                        child: Column(children: [
                          const ItemList(price: '279.00', title: 'Item Total'),
                          const SizedBox(height: 12),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                UnderlinedText(
                                    text: 'Delivery Charge',
                                    color: Colors.grey.shade400),
                                Text('\$50',
                                    style:
                                        TextStyle(color: Colors.grey.shade400))
                              ]),
                          const SizedBox(height: 12),
                          const ItemList(price: '5.00', title: 'Taxes'),
                          const SizedBox(height: 12),
                          Row(children: [
                            UnderlinedText(
                                text: 'Donate \$3 to feeding india Foundation',
                                color: Colors.grey.shade400),
                            const SizedBox(width: 15),
                            Text('Add',
                                style: TextStyle(color: Colors.red.shade400))
                          ]),
                          const SizedBox(height: 15),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Grand Total',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                                Text('\$334.00',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600))
                              ])
                        ])),
                    Divider(thickness: 1.5, color: Colors.grey.shade400),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 13),
                        child: Row(children: [
                          StatefulBuilder(
                              builder: (context, setstate) => Checkbox(
                                    activeColor: Colors.grey.shade500,
                                    checkColor: Colors.white,
                                    value: covidCheck,
                                    onChanged: (value) {
                                      setstate(() {
                                        covidCheck = value;
                                      });
                                    },
                                  )),
                          const SizedBox(width: 5),
                          Flexible(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'This order is related to a covid-19 emergency',
                                      style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontSize: 14,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 7),
                                  Text(
                                      'this order will be prepared and delivered on priority, it will be a contactless delivery. #restaursntsAgainstCOVID. Treat this as ambulance and please don\'t misuse it.',
                                      style: TextStyle(
                                          color: Colors.grey.shade400,
                                          overflow: TextOverflow.clip,
                                          fontSize: 14))
                                ]),
                          ),
                        ])),
                    Divider(thickness: 1.5, color: Colors.grey.shade400),
                    Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                const Text('Delivery instructions',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900)),
                                const SizedBox(height: 15),
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset('icons/checked.svg',
                                          width: 18, height: 18),
                                      const SizedBox(width: 10),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Hand me the Order',
                                                style: TextStyle(
                                                    color: Colors.grey.shade500,
                                                    fontSize: 12)),
                                            const SizedBox(height: 10),
                                            UnderlinedText(
                                                text: 'Add voice directions',
                                                color: Colors.red.shade400)
                                          ]),
                                    ])
                              ]),
                              Text('Change',
                                  style: TextStyle(color: Colors.red.shade400))
                            ])),
                    Divider(thickness: 1.5, color: Colors.grey.shade400),
                    Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Your details',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w900)),
                                    const SizedBox(height: 12),
                                    Text('Divya Sigatapu, 9109109109',
                                        style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 12)),
                                  ]),
                              Text('Change',
                                  style: TextStyle(color: Colors.red.shade400))
                            ])),
                    Divider(thickness: 1.5, color: Colors.grey.shade400),
                    Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Order for someone else',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w900)),
                                    const SizedBox(height: 12),
                                    Text('Send personalized message and e-card',
                                        style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 12)),
                                  ]),
                              Text('Add',
                                  style: TextStyle(color: Colors.red.shade400))
                            ])),
                    Divider(thickness: 1.5, color: Colors.grey.shade400),
                    Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset('icons/leaf.svg',
                                  width: 20, height: 20),
                              const SizedBox(width: 10),
                              Flexible(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Climate conscious delivery',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w900)),
                                      Text(
                                          'We fund environmental projects to offset the carbon footprint of our deliveries.',
                                          style: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 12,
                                              overflow: TextOverflow.clip)),
                                      Row(children: [
                                        Text('know more',
                                            style: TextStyle(
                                                color: Colors.red.shade400)),
                                        const SizedBox(width: 3),
                                        FaIcon(FontAwesomeIcons.caretRight,
                                            color: Colors.red.shade400,
                                            size: 12)
                                      ]),
                                      const SizedBox(height: 15),
                                      Text(
                                          'Orders  once placed cannot be cancelled and are non-refundable',
                                          style: TextStyle(
                                              color: Colors.red.shade400,
                                              overflow: TextOverflow.clip)),
                                    ]),
                              ),
                              const SizedBox(width: 45)
                            ])),
                    const SizedBox(height: 50),
                    Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: Row(children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Container(
                                    width: 35,
                                    height: 18,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        border: Border.all(
                                            color: Colors.grey.shade800)),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(FontAwesomeIcons.google,
                                              color: Colors.red.shade400,
                                              size: 10),
                                          const SizedBox(width: 2),
                                          Text('Pay',
                                              style: TextStyle(
                                                  color: Colors.grey.shade400,
                                                  fontSize: 10))
                                        ]),
                                  ),
                                  const SizedBox(width: 3),
                                  Text('PAY USING',
                                      style: TextStyle(
                                          color: Colors.grey.shade400)),
                                  FaIcon(FontAwesomeIcons.caretUp,
                                      color: Colors.grey.shade400, size: 12)
                                ]),
                                const SizedBox(height: 10),
                                const Text('Google pay',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900)),
                              ]),
                          const SizedBox(width: 10),
                          Container(
                              padding: const EdgeInsets.all(10),
                              width: SizeConfig.screenWidth * 0.60,
                              height: 61,
                              decoration: BoxDecoration(
                                  color: Colors.red.shade400,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text('\$334.00',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600)),
                                          Text('TOTAL',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w300))
                                        ]),
                                    Center(
                                      child: Row(children: const [
                                        Text('Place Order',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500)),
                                        SizedBox(width: 3),
                                        FaIcon(FontAwesomeIcons.caretRight,
                                            color: Colors.white, size: 12)
                                      ]),
                                    )
                                  ]))
                        ]))
                  ]),
                )),
            Positioned(
                top: 13,
                left: SizeConfig.screenWidth * 0.43,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.5),
                        color: Colors.black),
                    child: const Center(
                        child: FaIcon(FontAwesomeIcons.times,
                            color: Colors.white)),
                  ),
                ))
          ]);
        });
  }
}

class UnderlinedText extends StatelessWidget {
  final String text;
  final Color color;
  const UnderlinedText({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _textLength = text.length * 5.8;
    return Column(children: [
      Text(text,
          style: TextStyle(
            color: color,
            decorationStyle: TextDecorationStyle.dashed,
          )),
      Row(
        children: [
          for (var i = 0; i < _textLength / 2; i++)
            Container(
                margin: const EdgeInsets.only(top: 4),
                width: 2,
                height: 2,
                color: (i % 2 == 0) ? whiteColor : color),
        ],
      )
    ]);
  }
}

class ItemList extends StatelessWidget {
  final String title;
  final String price;
  const ItemList({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title, style: TextStyle(color: Colors.grey.shade400)),
      Text('\$$price', style: TextStyle(color: Colors.grey.shade400)),
    ]);
  }
}

class MTValet extends StatelessWidget {
  const MTValet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 40,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey.shade400)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SvgPicture.asset('icons/french.svg', width: 20, height: 20),
          Text('\$30')
        ]),
        Text('MOST TIPPED',
            style: TextStyle(color: Colors.red.shade300, fontSize: 9))
      ]),
    );
  }
}

class TipValet extends StatelessWidget {
  final int price;
  final String iconPath;
  const TipValet({
    Key? key,
    required this.price,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 75,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey.shade400)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        SvgPicture.asset(iconPath, width: 20, height: 20),
        Text('\$$price')
      ]),
    );
  }
}
