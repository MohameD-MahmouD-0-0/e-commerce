import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/Api_manger.dart';
import 'package:ecommerce/domain/datasource/delete_cart_item_remote_datasource.dart';
import 'package:ecommerce/domain/entites/RemoveCartitemResponseEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';

class DeleteCartItemDataSourceImp implements DeleteCartItemRemoteDatasource {
  ApiManger apiManger;

  DeleteCartItemDataSourceImp({required this.apiManger});

  @override
  Future<Either<Failer, RemoveCartitemResponseEntity>> deleteItem(String ProductID) async {
    var either = await apiManger.deletCartItem(ProductID);
    return either.fold((l) {
      return Left(Failer(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toEntity());
    });
  }
}
