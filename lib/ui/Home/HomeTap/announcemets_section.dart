import 'package:ecommerce/ui/utils/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class AnnouncemetsSection extends StatelessWidget {
  List<String> ImageeSlider = [
    'assets/images/Property 1=Default.png'
    'assets/images/Property 1=Variant2.png',
    'assets/images/Property 1=Variant3.png'
  ];

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      indicatorColor: MyTheme.PrimaryLight,
      indicatorBackgroundColor: MyTheme.WhiteColor,
      width: double.infinity,
        isLoop: true,
        autoPlayInterval: 3000,
        children: ImageeSlider.map((url) => Image.asset(
              url,
              fit: BoxFit.fill,
            )).toList());
  }
}
