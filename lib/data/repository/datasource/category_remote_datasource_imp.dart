import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/api_manger.dart';
import 'package:ecommerce/domain/datasource/Category_remote_datasorce_.dart';
import 'package:ecommerce/domain/entites/CategoryEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';

class CategoryRemoteDataSourceImp implements CategoryRemoteDataSource{
  ApiManger apiManger;
  CategoryRemoteDataSourceImp({required this.apiManger});
  @override
  Future<Either<Failer, CategoryEntity>> getAllCategory()async {
    var either = await apiManger.getAllCategory();
    return either.fold((l){
      return Left(Failer(errorMessage: l.errorMessage));
    },
     (response){
      return Right(response.toCategoryEntity());
    });
  }

}