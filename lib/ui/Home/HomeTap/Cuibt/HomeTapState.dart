import 'package:ecommerce/domain/entites/BrandesResponseEntity.dart';
import 'package:ecommerce/domain/entites/CategoryEntity.dart';

abstract class HomeTapState {}
class InitalHomeTapCategory extends HomeTapState{}

class LodingHomeTapCategory extends HomeTapState{
  String Lodingmessage;
  LodingHomeTapCategory({required this.Lodingmessage});

}
class ErrorHomeTapCategory extends HomeTapState{
  String ErrorMessage ;
  ErrorHomeTapCategory({required this.ErrorMessage});
}

class SussesHomeTapCategory extends HomeTapState{
  CategoryEntity categoryEntity;
  SussesHomeTapCategory({required this.categoryEntity});
}

class InitalHomeTapBrandes extends HomeTapState{}
class LodingHomeTapBrandes extends HomeTapState{}
class ErrorHomeTapBrandes extends HomeTapState{
  String errorMeassge;
  ErrorHomeTapBrandes({required this.errorMeassge});
}
class SussesHomeTapBrandes extends HomeTapState{
  BrandesResponseEntity brandesResponseEntity;
  SussesHomeTapBrandes({required this.brandesResponseEntity});
}