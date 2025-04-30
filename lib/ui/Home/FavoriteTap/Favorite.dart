import 'package:ecommerce/domain/di.dart';
import 'package:ecommerce/domain/entites/AddToWishListEntity.dart';
import 'package:ecommerce/ui/Home/FavoriteTap/Cuibt/GetWishListState.dart';
import 'package:ecommerce/ui/Home/FavoriteTap/Cuibt/add_to_wish_list_view_model.dart';
import 'package:ecommerce/ui/Home/custom_search_with_shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entites/CategoryEntity.dart';
import '../../utils/MyTheme.dart';
import 'Cuibt/get_wishList_view_model.dart';
import 'custom_wishList_item.dart';

class Favorite extends StatelessWidget {
  static const String routeName = 'Add To Cart Tap';
  final GetWishListViewModel viewModel =
  GetWishListViewModel(getWishListUseCase: injectGetWishListUseCase());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30,left: 10),
            child: Image.asset('assets/images/Group 5 (1).png'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 10),
            child: CustomSearchWithShoppingCart(),
          ),
          Expanded(
            child: BlocBuilder<GetWishListViewModel, GetWishListState>(
              bloc: viewModel..getWishList(),
              builder: (context, state) {
                if (state is LodingGetWishList) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ErrorGetWishList) {
                  return Center(child: Text('Error loading wishlist'));
                } else if (state is SuccessGetWishList) {
                  final wishlistItems = state.getWishListResponseEntity.data;
                  if (wishlistItems == null || wishlistItems.isEmpty) {
                    return Center(
                      child: Text(
                        'Your wishlist is empty.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: wishlistItems.length,
                    itemBuilder: (context, index) {
                      return CustomWishlistItem(
                        dataEntity: wishlistItems[index],
                      );
                    },
                  );
                }
                return Center(
                  child: Text(
                    'Empty Page',
                    style: TextStyle(
                      fontSize: 20,
                      color: MyTheme.PrimaryLight,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
