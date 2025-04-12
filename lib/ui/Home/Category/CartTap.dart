import 'package:ecommerce/domain/di.dart';
import 'package:ecommerce/ui/Home/Category/Cuibt/get_cart_item_state.dart';
import 'package:ecommerce/ui/Home/Category/Cuibt/get_cart_item_view_model.dart';
import 'package:ecommerce/ui/utils/MyTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_cart_item.dart';

class AddToCartTap extends StatelessWidget {
  static const String routeName = 'Add To Cart Tap';

  @override
  Widget build(BuildContext context) {
    GetCartItemViewModel viewModel =
        GetCartItemViewModel(getCartItemUseCase: injectGetCartItemUseCase());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Cart',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
                color: MyTheme.PrimaryLight),
          ),
          actions: [
            Icon(
              Icons.search,
              size: 30,
              color: MyTheme.PrimaryLight,
            ),
            SizedBox(width: 20),
            Icon(
              Icons.shopping_cart_outlined,
              size: 30,
              color: MyTheme.PrimaryLight,
            ),
          ],
        ),
        body: BlocBuilder<GetCartItemViewModel, CartItemState>(
            bloc: viewModel..getCartItem(),
            builder: (context, state) {
              if (state is LodingCartItemState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ErrorCartItemStateState) {
                return Text(state.errorMessage);
              } else if (state is SuccsesCartItemStateState) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    print(state.cartEntity.data!.products![index]);
                    return CustomCartItem(
                        getProductsCartItem:
                            state.cartEntity.data!.products![index]);
                  },
                  itemCount: state.cartEntity.data?.products?.length ?? 0,
                );
              }
              return Center(
                  child: Text(
                'Empty Cart',
                style: TextStyle(
                    fontSize: 20,
                    color: MyTheme.PrimaryLight,
                    fontWeight: FontWeight.w500),
              ));
            }));
  }
}
