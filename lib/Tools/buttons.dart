import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zomato_foodapp_design_clone/Configurations/constant.dart';

class Button extends StatelessWidget {
  final Color color;
  final String text;
  final double width;
  const Button({
    Key? key,
    required this.color,
    required this.text,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
        width: SizeConfig.screenWidth * width,
        height: SizeConfig.defaultSize * 5.5,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(text,
              style: TextStyle(
                  color: color == whiteColor ? Colors.black : whiteColor,
                  fontSize: SizeConfig.defaultSize * 2.5,
                  letterSpacing: 1)),
        ));
  }
}

class IconButtons extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final double width;
  const IconButtons({
    Key? key,
    required this.color,
    required this.text,
    required this.width,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.screenWidth * width,
      height: SizeConfig.defaultSize * 5.5,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Spacer(flex: 1),
        FaIcon(
          icon,
          color: color == whiteColor ? Colors.black : whiteColor,
        ),
        const Spacer(flex: 2),
        Center(
          child: Text(text,
              style: TextStyle(
                  color:
                      color == whiteColor ? Colors.grey.shade600 : whiteColor,
                  fontSize: SizeConfig.defaultSize * 2,
                  letterSpacing: 1)),
        ),
        const Spacer(flex: 2),
      ]),
    );
  }
}

class Tabs extends StatelessWidget {
  final String text;
  final String? text2;
  final Widget right;
  final Widget left;
  const Tabs({
    Key? key, required this.text, this.text2, required this.right , required this.left ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget setter = ((text2 == null )?  Container() : Text(text2!)) ;
    
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 0.5),
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 0.5),
      width: SizeConfig.defaultSize * 8.5,
      height: SizeConfig.defaultSize * 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 0.7, color: Colors.grey.shade400),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        left,
        Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(text),
        setter
        ]),
        right,
      ]),
    );
  }

}
