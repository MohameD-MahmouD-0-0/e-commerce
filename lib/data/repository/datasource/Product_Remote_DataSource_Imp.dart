import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/api_manger.dart';
import 'package:ecommerce/domain/datasource/Product_Remote_dataSource.dart';
import 'package:ecommerce/domain/entites/ProductResponseEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';

class ProductRemoteDataSourceImp implements ProductRemoteDatasource{
  ApiManger apiManger;
  ProductRemoteDataSourceImp({required this.apiManger});
  @override
  Future<Either<Failer, ProductResponseEntity>> getAllProduct() async {
    var either = await apiManger.getAllProduct();
     return either.fold((l){
       return Left(Failer(errorMessage: l.errorMessage));
    }, (response){
       return Right(response.toProductResponseDto());
       // return Right(response as ProductResponseEntity);
    });
  }
}