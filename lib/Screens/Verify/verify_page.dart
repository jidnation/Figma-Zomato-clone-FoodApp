import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zomato_foodapp_design_clone/Configurations/constant.dart';
import 'package:zomato_foodapp_design_clone/Tools/text_field.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          color: whiteColor,
          padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    InkWell(
                        child: const FaIcon(FontAwesomeIcons.arrowLeft),
                        onTap: () {
                          Navigator.pop(context);
                        }),
                    const Spacer(flex: 2),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      const Text('We have sent a verification code to'),
                      SizedBox(
                        height: SizeConfig.defaultSize,
                      ),
                      const Text('+91-9010858965'),
                      SizedBox(
                        height: SizeConfig.defaultSize,
                      ),
                     SizedBox(
                       width: SizeConfig.defaultSize * 30,
                       height: SizeConfig.defaultSize * 4,
                       child: ListView.builder(
                         scrollDirection: Axis.horizontal,
                         itemCount: 6,
                         itemBuilder:  (context, index) =>  Container(
                           margin: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 0.3),
                           child: const OTPBox()),
                         ),
                     )
                    ]),
                    const Spacer(flex: 2),
                  ]),
              Column(children: [
                const Text('countDown timer here'),
                SizedBox(
                  height: SizeConfig.defaultSize,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    'Didn\'t recieve the code?',
                  ),
                  SizedBox(
                    width: SizeConfig.defaultSize,
                  ),
                  InkWell(
                    child: Text('Resend now',
                        style: TextStyle(color: Colors.grey.shade400)),
                    onTap: () {},
                  ),
                ]),
              ])
            ],
          ),
        ),
      ),
    );
  }
}

