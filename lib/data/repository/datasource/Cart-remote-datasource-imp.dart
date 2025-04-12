import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/api_manger.dart';
import 'package:ecommerce/domain/entites/ResponseCartEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';
import '../../../domain/datasource/cart-remote-datasource.dart';

class CartRemoteDataSourceImp implements CartRemoteDataSource {
  ApiManger apiManger;

  CartRemoteDataSourceImp({required this.apiManger});

  @override
  Future<Either<Failer, ResponseCartEntity>> getCartItem() async {
    var either = await apiManger.getCartItem();
    return either.fold((l) {
      return Left(Failer(errorMessage: l.errorMessage));
    }, (response)
    {
      return Right(response.intoResponseCartDto());
      }
    );
  }
}