import 'package:ecommerce/ui/Home/HomeTap/Cuibt/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../AccountTap/Account.dart';
import '../../Category/Category.dart';
import '../../FavoriteTap/Favorite.dart';
import '../Home.dart';

class HomeScreenViewModel extends Cubit<HomeState>{
  int currentInd = 0;
  HomeScreenViewModel():super(InintialHomeState());
  List<Widget> taps = [Home(), Category(),Favorite(),Account()];

  void ChangeBottemSelection(int newSelect){
    currentInd = newSelect  ;
    emit(ChangeBottomIndex());
  }
}