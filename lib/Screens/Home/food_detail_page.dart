import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zomato_foodapp_design_clone/Configurations/constant.dart';
import 'package:zomato_foodapp_design_clone/Configurations/general.dart';
import 'package:zomato_foodapp_design_clone/Screens/Home/widgets.dart';

class FoodDetailPage extends StatelessWidget {
  final Map<String, dynamic> container;
  const FoodDetailPage({Key? key, required this.container}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: Padding(
            padding: const EdgeInsets.only(left: 13),
            child: Column(children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(container['title'],
                              style: textStying(
                                  weight: FontWeight.bold,
                                  size: 22,
                                  color: Colors.grey.shade800)),
                          const SizedBox(height: 5),
                          Text(container['subTitle'],
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
                                Text('${container['rating']}',
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
                                image: AssetImage('images/imagesbg.png'),
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
                 const Align(
                   alignment: Alignment.centerLeft,
                   child: MaxDeliveryDesign()),
            ]),
          ),
        ));
  }
}
