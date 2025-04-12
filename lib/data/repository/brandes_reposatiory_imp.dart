import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/datasource/brandes_Remote_datasource.dart';
import 'package:ecommerce/domain/entites/BrandesResponseEntity.dart';
import 'package:ecommerce/domain/entites/failer.dart';

import '../../domain/reposatiory/brandes_reposatiory_contract.dart';

class BrandesReposatioryImp implements BrandesReposatioryContract{
  BrandesRemoteDataSource brandesRemoteDataSource;
  BrandesReposatioryImp({required this.brandesRemoteDataSource});
  @override
  Future<Either<Failer, BrandesResponseEntity>> getAllBrandes() {
    return brandesRemoteDataSource.getAllBrandes();
  }
}