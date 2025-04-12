import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/api_manger.dart';
import 'package:ecommerce/domain/entites/BrandesResponseEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';

import '../../../domain/datasource/brandes_Remote_datasource.dart';

class BrandesRemoteDataSourceImp implements BrandesRemoteDataSource {
  ApiManger apiManger;

  BrandesRemoteDataSourceImp({required this.apiManger});

  @override
  Future<Either<Failer, BrandesResponseEntity>> getAllBrandes() async {
    var either = await apiManger.getAllBrandes();
    return either.fold((l) {
      return Left(Failer(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toBrandesEntity());
    });
  }
}
