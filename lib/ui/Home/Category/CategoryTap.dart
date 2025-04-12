import 'package:ecommerce/domain/di.dart';
import 'package:ecommerce/ui/Home/Category/Cuibt/Product_tap_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/MyTheme.dart';
import 'CartTap.dart';
import 'Cuibt/Prodcut_tap_state.dart';
import 'CustomProduct.dart';
import 'Product_Detailes_view.dart';

class CategoryTap extends StatelessWidget {
  ProdcutTapViewModel viewModel = ProdcutTapViewModel(
  productuseCase: injectProductUseCase(),
  addToCartUseCase: injectAddtoCartUseCase(),
  )..getAllProduct();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>viewModel..getAllProduct(),
      child: BlocBuilder<ProdcutTapViewModel, ProdctState>(
        builder: (context, state) {
          final viewModel = ProdcutTapViewModel.get(context);

          if (state is LodingProductState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ErrorProductState) {
            return Center(child: Text(state.errorMessage));
          } else if (state is SuccsesProductState || state is SuccsesAddToCart) {
            final products = viewModel.prodcutList;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30,left: 10),
                  child: Image.asset('assets/images/Group 5 (1).png'),
                ),SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: MyTheme.PrimaryLight),
                        ),
                        child: TextField(
                          cursorColor: MyTheme.PrimaryLight,
                          decoration: InputDecoration(
                            hintText: 'What are you looking for?',
                            hintStyle: TextStyle(fontSize: 14),
                            prefixIcon: Icon(Icons.search, color: MyTheme.PrimaryLight),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Badge(
                        label: Text(viewModel.numOfCartItem.toString()),
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed(AddToCartTap.routeName);
                          },
                            child: Image.asset('assets/images/Vector.png')),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: products?.length ?? 0,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.65,
                    ),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          ProductDetailesView.routeName,
                          arguments: products[index],
                        );
                      },
                      child: CustomProduct(dataEntity: products![index]),
                    ),
                  ),
                ),
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}
