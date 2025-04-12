import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/reposatiory/category_reposatiory_contract.dart';
import '../entites/CategoryEntity.dart';
import '../entites/failer.dart';

class CategoryUseCase {
  CategoryReposatioryContract reposatioryContract;
  CategoryUseCase({required this.reposatioryContract});
  Future<Either<Failer,CategoryEntity>>invoke(){
    return reposatioryContract.getAllCategory();
  }

}