import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/Api_manger.dart';

import '../../../domain/datasource/update_cart_item_remote_datasource.dart';
import '../../../domain/entites/UpdateCartItemEntity.dart';
import '../../../domain/entites/failer.dart';

class UpdateCartItemRemoteDataSourceImp implements UpdateCartItemRemoteDatasource{
  ApiManger apiManger;
  UpdateCartItemRemoteDataSourceImp({required this.apiManger});
  @override
  Future<Either<Failer,UpdateCartItemEntity>> updateCart(String cartID,String Count) async {
    var either = await apiManger.updateCartItem(cartID, Count);
    return either.fold((l) {
      return Left(Failer(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toEntity());
    });

  }
}