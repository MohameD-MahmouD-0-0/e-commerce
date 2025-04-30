import '../../../../domain/entites/GetWishListResponseEntity.dart';

abstract class GetWishListState{}
class LodingGetWishList extends GetWishListState{}
class ErrorGetWishList extends GetWishListState{
  String errorMessage;
  ErrorGetWishList({required this.errorMessage});
}
class SuccessGetWishList extends GetWishListState{
  GetWishListResponseEntity getWishListResponseEntity;
  SuccessGetWishList({required this.getWishListResponseEntity});
}
