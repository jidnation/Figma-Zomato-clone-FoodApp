import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body: ListView(children: [
        Column(children: [
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
          Column(children: [
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
            Stack(children: [
              SizedBox(
                width: SizeConfig.screenWidth,
                height: 670,
                child: TabBarView(controller: _homeTabController, children: [
                  DeliveryTab(lastMember: lastMember),
                  DinningTab(),
                  Container(width: SizeConfig.screenWidth),
                ]),
              ),
            ]),
          ]),
        ]),
      ]),
    );
  }
}

