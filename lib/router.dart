import 'package:flutter/material.dart';
import 'package:zomato_foodapp_design_clone/Routes/contacts.dart';
import 'package:zomato_foodapp_design_clone/Screens/Sign_up/sign_up_page.dart';

class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signUpPage:
        {
          return MaterialPageRoute(builder: (_) =>const SignUpPage());
        }
      default:
        {
          return MaterialPageRoute(
              builder: (_) => Scaffold(
                  appBar: AppBar(
                    title: const Text('Zomato FoodStore'),
                  ),
                  body: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    color: const Color(0xffCB202D),
                    child: const Center(
                      child: Text('ERROR 404\n Page Not FOUND!',
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
