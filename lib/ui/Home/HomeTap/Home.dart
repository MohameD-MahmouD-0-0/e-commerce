import 'package:ecommerce/domain/di.dart';
import 'package:ecommerce/ui/Home/HomeTap/CategorySection.dart';
import 'package:ecommerce/ui/Home/HomeTap/Cuibt/home_tap_view_model.dart';
import 'package:ecommerce/ui/utils/MyTheme.dart';
import 'package:flutter/material.dart';
import '../custom_search_with_shopping_cart.dart';
import 'announcemets_section.dart';

class Home extends StatelessWidget {
  HomeTapViewModel viewModel = HomeTapViewModel(
      categoryUseCase: injectGetAllCategoryUseCase(),
      brandesUseCase: injectGetAllBrandesUseCase());

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20, left: 10),
        child: Image.asset('assets/images/Group 5 (1).png'),
      ),
      SizedBox(height: 10),
      CustomSearchWithShoppingCart(),
      SizedBox(height: 20),
      AnnouncemetsSection(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: MyTheme.PrimaryLight),
            ),
            Text(
              'view all',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: MyTheme.PrimaryLight),
            )
          ],
        ),
      ),
      Container(height: 250, child: CategorySection()),
    ]);
  }
}
