import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/BrandesResponseEntity.dart';
import 'package:ecommerce/domain/reposatiory/brandes_reposatiory_contract.dart';

import '../entites/failer.dart';

class BrandesUseCase {
  BrandesReposatioryContract brandesReposatioryContract;

  BrandesUseCase({required this.brandesReposatioryContract});

  Future<Either<Failer, BrandesResponseEntity>>invoke() {
     return brandesReposatioryContract.getAllBrandes();
  }
}