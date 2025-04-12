import 'package:ecommerce/ui/Home/Category/CategoryTap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../AccountTap/Account.dart';
import '../FavoriteTap/Favorite.dart';
import '../HomeTap/Home.dart';
import 'home_state.dart';

class HomeScreenViewModel extends Cubit<HomeState>{

  int currentInd = 0;
  HomeScreenViewModel():super(InintialHomeState());
  List<Widget> taps = [Home(), CategoryTap(),Favorite(),Account()];

  void ChangeBottemSelection(int newSelect){
    currentInd = newSelect  ;
    emit(ChangeBottomIndex());
  }
}