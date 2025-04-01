import 'package:ecommerce/ui/Home/custom_search_with_shopping_cart.dart';
import 'package:flutter/material.dart';

import 'announcemets_section.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20,left: 10),
          child: Image.asset('assets/images/Group 5 (1).png'),
        ),
        SizedBox(height: 10),
        CustomSearchWithShoppingCart(),
        SizedBox(height: 30,),
        AnnouncemetsSection()
      ],
    );
  }
}