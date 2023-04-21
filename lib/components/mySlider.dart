import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MySlider extends StatelessWidget {
  const MySlider({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return CarouselSlider(items: [
      Container(
        width: width,
        height: height * 0.5,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/content/cream.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('asd')],
        ),
      ),
    ], options: CarouselOptions());
  }
}
