
import 'package:flutter/material.dart';

class IntroSliderItem extends StatelessWidget {
  String  photo;

  IntroSliderItem({this.photo});

  @override
  Widget build(BuildContext context) {
    return Image.asset(photo, fit: BoxFit.fill,);
  }
}
