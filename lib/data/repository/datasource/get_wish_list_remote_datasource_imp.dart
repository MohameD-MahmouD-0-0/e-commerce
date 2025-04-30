import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/Api_manger.dart';
import 'package:ecommerce/domain/entites/GetWishListResponseEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';
import '../../../domain/datasource/get_wish_list_remote_datasource.dart';

class GetWishListRemoteDataSourceImp implements GetWishListRemoteDatasource {
  ApiManger apiManger;

  GetWishListRemoteDataSourceImp({required this.apiManger});

  @override
  Future<Either<Failer, GetWishListResponseEntity>> getWishList() async {
    var either = await apiManger.getWishList();
    return either.fold((l) {
      return Left(Failer(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toEntity());
    });
  }
}
