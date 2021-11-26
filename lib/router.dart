import 'package:flutter/material.dart';
import 'package:zomato_foodapp_design_clone/Configurations/constant.dart';
import 'package:zomato_foodapp_design_clone/Routes/contacts.dart';
import 'package:zomato_foodapp_design_clone/Screens/Sign_up/sign_up_page.dart';
import 'package:zomato_foodapp_design_clone/Screens/Verify/verify_page.dart';

class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signUpPage:
        {
          return MaterialPageRoute(builder: (_) =>const SignUpPage());
        }
        case verificationPage:
        {
          return MaterialPageRoute(builder: (_) =>const VerificationPage());
        }
      default:
        {
          return MaterialPageRoute(
              builder: (_) => Scaffold(
                  appBar: AppBar(
                    backgroundColor: kPrimaryColor,
                    elevation: 0,
                    title: const Text('Zomato FoodStore'),
                  ),
                  body: Container(
                    alignment: Alignment.center,
                    height: double.maxFinite,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(gradient: lGradient),
                    child: const Center(
                      child: Text('ERROR 404\nPage Not FOUND!',
                          style: TextStyle(
                              color: Color(0xfff4f4f2),
                              fontSize: 20,
                              letterSpacing: 1)),
                    ),
                  )));
        }
    }
  }
}
