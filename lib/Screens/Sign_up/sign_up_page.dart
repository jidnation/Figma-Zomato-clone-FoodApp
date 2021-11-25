import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zomato_foodapp_design_clone/Configurations/constant.dart';
import 'package:zomato_foodapp_design_clone/Tools/buttons.dart';
import 'package:zomato_foodapp_design_clone/Tools/text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // print(SizeConfig.defaultSize); // calculating the size of the screen pixel
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            decoration: const BoxDecoration(
              gradient: lGradient,
            ),
            child: Stack(children: [
              Positioned(
                top: SizeConfig.defaultSize * 2,
                right: SizeConfig.defaultSize,
                child: Container(
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(25)),
                    child: const Center(
                      child: Text(
                        "Skip",
                        style: TextStyle(color: whiteColor),
                      ),
                    )),
              ),
              // const Spacer(),
              Positioned.fill(
                top: SizeConfig.screenHeight * 0.30,
                child: Center(
                  child: SizedBox(
                    width: SizeConfig.screenWidth * 0.8,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(children: const [
                              FormFieldGen(),
                            ]),
                          ),
                          SizedBox(height: SizeConfig.defaultSize * 2),
                          const Button(
                            color: Colors.black,
                            text: 'Send OTP',
                            width: 0.8,
                          ),
                          SizedBox(
                            height: SizeConfig.defaultSize * 2,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: SizeConfig.screenWidth * 0.30,
                                  height: 1,
                                  color: whiteColor,
                                ),
                                const Text('OR',
                                    style: TextStyle(color: whiteColor)),
                                Container(
                                  width: SizeConfig.screenWidth * 0.30,
                                  height: 1,
                                  color: whiteColor,
                                )
                              ]),
                          SizedBox(
                            height: SizeConfig.defaultSize * 2,
                          ),
                          const IconButtons(
                              color: whiteColor,
                              text: 'Continue with Email',
                              width: 0.8,
                              icon: Icons.email),
                          SizedBox(
                            height: SizeConfig.defaultSize * 2,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const IconButtons(
                                    color: whiteColor,
                                    text: 'Facebook',
                                    width: 0.39,
                                    icon: FontAwesomeIcons.facebook),
                                SizedBox(width: SizeConfig.defaultSize * 0.6),
                                const IconButtons(
                                    color: whiteColor,
                                    text: 'Google',
                                    width: 0.39,
                                    icon: FontAwesomeIcons.google),
                              ]),
                          SizedBox(
                            height: SizeConfig.defaultSize * 2,
                          ),
                          const Text(
                            'By continuing, you agree to our',
                            style: TextStyle(color: whiteColor),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Terms of service",
                                  style: TextStyle(
                                    color: whiteColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                Text(
                                  ' Privacy Policy',
                                  style: TextStyle(
                                    color: whiteColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                Text(
                                  ' Content Policy',
                                  style: TextStyle(
                                    color: whiteColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ])
                        ]),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
