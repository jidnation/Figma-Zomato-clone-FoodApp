import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zomato_foodapp_design_clone/Tools/genrators.dart';

const List<String> text1 = ['MAX', 'PRO', 'Cuisines', 'Rating', 'Popular'];
const List<String?> text2 = ['Safety', null, null, null, null];
final List<Widget> right = [
  const Text(''),
  const Text(''),
  const FaIcon(FontAwesomeIcons.angleDown),
  const Text(''),
  const Text('')
];
final List<Widget> left = [
  const Text(''),
  SvgPicture.asset('icons/pro.svg'),
  const Text(''),
  const Text(''),
  SvgPicture.asset('icons/popular.svg')
];

final List<List<String>> foodMenu = [
  ['images/Healthy.png', 'Healthy'],
  ['images/Biryani.png', 'Biryani'],
  ['images/Pizza.png', 'Pizza'],
  ['images/Haleem.png', 'Haleem'],
  ['images/Chicken.png', 'Chicken'],
  ['images/Burger.png', 'Burger'],
  ['images/Cake.png', 'Cake'],
  ['images/Shawarma.png', 'Shawarma'],
];

List foodsDetailList = [];