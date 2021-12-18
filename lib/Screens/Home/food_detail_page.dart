import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zomato_foodapp_design_clone/Configurations/constant.dart';
import 'package:zomato_foodapp_design_clone/Configurations/general.dart';
import 'package:zomato_foodapp_design_clone/Screens/Home/widgets.dart';

class FoodDetailPage extends StatefulWidget {
  final Map<String, dynamic> container;
  const FoodDetailPage({Key? key, required this.container}) : super(key: key);

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _homeTabController;

  @override
  void initState() {
    super.initState();
    _homeTabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _homeTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lastMember = widget.container['title'].split(' ');
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          leading: Center(
              child: InkWell(
            child: FaIcon(
              FontAwesomeIcons.angleLeft,
              color: Colors.grey.shade700,
              size: 25,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.container['title'],
                              style: textStying(
                                  weight: FontWeight.bold,
                                  size: 22,
                                  color: Colors.grey.shade800)),
                          const SizedBox(height: 5),
                          Text(widget.container['subTitle'],
                              style: textStying(
                                  weight: FontWeight.w300,
                                  size: 16,
                                  color: Colors.grey.shade700)),
                          const SizedBox(height: 5),
                          Text('Kukatpaly, Hyderbad',
                              style: textStying(
                                  weight: FontWeight.w200,
                                  size: 14,
                                  color: Colors.grey.shade600)),
                        ]),
                    Column(children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        height: 43,
                        width: 78,
                        decoration: BoxDecoration(
                            color: const Color(0xff4ab425).withOpacity(0.8),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            )),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Text('${widget.container['rating']}',
                                    style: textStying(
                                        color: whiteColor,
                                        size: 15,
                                        weight: FontWeight.w500)),
                                const SizedBox(width: 5),
                                const FaIcon(
                                  FontAwesomeIcons.solidStar,
                                  color: whiteColor,
                                  size: 12,
                                )
                              ]),
                              const SizedBox(height: 3),
                              Text(
                                'DELIVERY ',
                                style: textStying(
                                    color: whiteColor,
                                    weight: FontWeight.w300,
                                    size: 10),
                              )
                            ]),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        height: 43,
                        width: 78,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: const AssetImage('images/imagesbg.png'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.grey.shade500, BlendMode.darken)),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            )),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('6\nPHOTOS',
                                  style: textStying(
                                      color: whiteColor,
                                      size: 15,
                                      weight: FontWeight.w500)),
                            ]),
                      ),
                    ])
                  ]),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 13),
              child: Align(
                  alignment: Alignment.centerLeft, child: MaxDeliveryDesign()),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: TabBar(
                  labelColor: Colors.white,
                  indicator: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  // labelStyle: TextStyle(backgroundColor: Colors.amberAccent),
                  unselectedLabelColor: Colors.grey.shade600,
                  unselectedLabelStyle: const TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                  controller: _homeTabController,
                  tabs: const [
                    Tab(text: 'DELIVERY'),
                    Tab(
                      text: 'DINNING',
                    ),
                    Tab(
                      text: 'REVIEWS',
                    )
                  ]),
            ),
            SizedBox(height: SizeConfig.defaultSize),
            SizedBox(
              width: SizeConfig.screenWidth,
              height: 650,
              child: TabBarView(controller: _homeTabController, children: [
                Column(children: [
                  Stack(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
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
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultSize * 2), 
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
                            child: Text('${lastMember[lastMember.length - 1]}',
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
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Recommended',
                              style: TextStyle(color: Colors.grey.shade700)),
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
                              Text('Menu', style: TextStyle(
                                color: whiteColor,
                                fontSize: 17
                              ))
                            ]),),),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 51,
                    padding: const EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade200)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 139,
                          height: 17,
                          decoration: BoxDecoration(
                            color: const Color(0xff1a30f3),
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: const Center(
                            child: Text('30% OFF up to \$75', 
                            style: TextStyle(
                              color: whiteColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15
                            )
                            ),
                          ),
                        ),
                        const Text('Use code ZOMSAFETY on orders with items\nworth \$159 or more', 
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 10,

                        )
                        )
                      ]
                    )
                  )
                ]),
                Container(),
                Container()
              ]),
            ),
          ]),
        ));
  }
}
