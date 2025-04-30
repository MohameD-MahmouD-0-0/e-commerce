import 'package:ecommerce/domain/datasource/get_wish_list_usecase.dart';
import 'package:ecommerce/domain/entites/GetWishListResponseEntity.dart';
import 'package:ecommerce/ui/Home/FavoriteTap/Cuibt/GetWishListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetWishListViewModel extends Cubit<GetWishListState>{
  List<GetWishListDataEntity> wishList=[];
  GetWishListUseCase getWishListUseCase;
  GetWishListViewModel({required this.getWishListUseCase}):super(LodingGetWishList());

  getWishList()async{
    var either=await getWishListUseCase.invoke();
    either.fold((l){
      emit(ErrorGetWishList(errorMessage: l.errorMessage));
  }, (response){
      wishList = response.data!;
      emit(SuccessGetWishList(getWishListResponseEntity: response));
    });
  }
}