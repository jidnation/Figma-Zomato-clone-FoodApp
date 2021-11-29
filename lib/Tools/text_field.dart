import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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


class OTPBox extends StatelessWidget {
  const OTPBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: SizeConfig.defaultSize * 3.5,
        child: TextFormField(
          autofocus: true,
          cursorColor: Colors.grey.shade800,
          cursorHeight: SizeConfig.defaultSize * 3,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          style: TextStyle(
              fontSize: SizeConfig.defaultSize * 3,
              fontWeight: FontWeight.w800),
          textAlign: TextAlign.center,
          keyboardType:
              const TextInputType.numberWithOptions(),
          decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                  vertical: SizeConfig.defaultSize * 0.5),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.grey.shade700,
                width: 3,
              ),),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                // borderSide: BorderSide(color: Colors.grey)
              )),
        ));
  }
}
