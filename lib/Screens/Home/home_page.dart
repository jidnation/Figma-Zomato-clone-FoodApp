import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zomato_foodapp_design_clone/Configurations/constant.dart';
import 'package:zomato_foodapp_design_clone/Screens/Home/body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: const HomePageBody(),
      bottomNavigationBar:  BottomNavigationBar(
             type: BottomNavigationBarType.fixed,
                elevation: 0,
                backgroundColor: whiteColor,
                selectedItemColor: Colors.grey.shade800,
                items: [
                  const BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.spa), label: ''),
                  BottomNavigationBarItem(icon: SvgPicture.asset('icons/shoe.svg'), label: ''),
                  BottomNavigationBarItem(icon: SvgPicture.asset('icons/pro.svg'), label: ''),
                  BottomNavigationBarItem(icon: SvgPicture.asset('icons/flashHeart.svg'), label: ''),
                ]
                ),
    );
  }
}
