import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/datasource/Category_remote_datasorce_.dart';
import 'package:ecommerce/domain/entites/CategoryEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';
import 'package:ecommerce/domain/reposatiory/category_reposatiory_contract.dart';

class CategoryReposatioryImp implements CategoryReposatioryContract{
  CategoryRemoteDataSource categoryRemoteDataSource;
  CategoryReposatioryImp({required this.categoryRemoteDataSource});
  @override
  Future<Either<Failer, CategoryEntity>> getAllCategory() {
    return categoryRemoteDataSource.getAllCategory();
  }
}