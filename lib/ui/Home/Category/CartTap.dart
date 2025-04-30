import 'package:ecommerce/domain/di.dart';
import 'package:ecommerce/ui/Home/Category/Cuibt/get_cart_item_view_model.dart';
import 'package:ecommerce/ui/Home/Category/Cuibt/get_cart_item_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/MyTheme.dart';
import 'custom_cart_item.dart';

class AddToCartTap extends StatelessWidget {
  static const String routeName = 'Add To Cart Tap';

  final viewModel = GetCartItemViewModel(
    updateCartItemUseCase: injectUpdateCartItemUseCase(),
    getCartItemUseCase: injectGetCartItemUseCase(),
    deleteCartItemUseCase: injectDeleteCartItemUseCase(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel..getCartItem(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Cart',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 25,
                color: MyTheme.PrimaryLight),
          ),
          actions: [
            Icon(Icons.search, size: 25, color: MyTheme.PrimaryLight),
            SizedBox(width: 20),
            Icon(Icons.shopping_cart_outlined,
                size: 25, color: MyTheme.PrimaryLight),
          ],
        ),
        body: BlocBuilder<GetCartItemViewModel, CartItemState>(
          builder: (context, state) {
            if (state is LodingCartItemState ||
                state is LodingDeleteCartItemState||state is LodingUpdateCartItemState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ErrorCartItemStateState ||
                state is ErrorDeleteCartItemState) {
              return Center(child: Text('Error loading cart'));
            } else if (state is SuccsesCartItemStateState) {
              return ListView.builder(
                itemCount: state.cartEntity.data?.products?.length ?? 0,
                itemBuilder: (context, index) {
                  return CustomCartItem(
                    getProductsCartItem: state.cartEntity.data!.products![index],
                  );
                },
              );
            } else if (state is SuccessDeleteCartItemState ||
                state is SuccessesUpdateCartItemStateState) {
              return ListView.builder(
                itemCount: viewModel.cartList!.length,
                itemBuilder: (context, index) {
                  return CustomCartItem(
                    getProductsCartItem: viewModel.cartList![index],
                  );
                },
              );
            }
            return Center(
              child: Text(
                'Empty Cart',
                style: TextStyle(
                    fontSize: 20,
                    color: MyTheme.PrimaryLight,
                    fontWeight: FontWeight.w500),
              ),
            );
          },
        ),
      ),
    );
  }
}
