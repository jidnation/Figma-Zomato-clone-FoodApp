import 'package:flutter/material.dart';
import 'package:zomato_foodapp_design_clone/Configurations/constant.dart';

class FormFieldGen extends StatelessWidget {
  const FormFieldGen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextFormField(
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.none,
            fontSize: SizeConfig.defaultSize * 2.5,
            letterSpacing: 1),
        decoration: InputDecoration(
          hintText: '+91 9010858965',
          hintStyle: const TextStyle(
            color: Colors.black,
          ),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: SizeConfig.defaultSize * 1.5,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
