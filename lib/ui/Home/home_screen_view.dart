import 'package:ecommerce/ui/custam_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cuibt/home_screen_view_model.dart';
import 'Cuibt/home_state.dart';
import 'custom_search_with_shopping_cart.dart';

class HomeScreenView extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

@override
class _HomeScreenViewState extends State<HomeScreenView> {
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenViewModel, HomeState>(
        bloc: viewModel,
        builder: (context, state) {
          return Scaffold(
              bottomNavigationBar: BulidCustomBottomNamvigationBar(
                  selectedInd: viewModel.currentInd,
                  onTapFunction: (index) {
                    viewModel.ChangeBottemSelection(index);
                  },
                  context: context),
              body: viewModel.taps[viewModel.currentInd]);
        },
        listener: (context, state) {});
  }
}
