import 'package:flutter/material.dart';
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
    required this.width, required this.icon,
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
