import 'package:ecommerce/domain/datasource/brandes_use_case.dart';
import 'package:ecommerce/domain/datasource/category_use_case.dart';
import 'package:ecommerce/domain/entites/BrandesResponseEntity.dart';
import 'package:ecommerce/domain/entites/CategoryEntity.dart';
import 'package:ecommerce/ui/Home/HomeTap/Cuibt/HomeTapState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTapViewModel extends Cubit<HomeTapState>{
  CategoryUseCase categoryUseCase ;
  BrandesUseCase brandesUseCase;
  List<DataEntity>? categoryList ;
  List<DataBrandesEntity>?brandesList;
  HomeTapViewModel({required this.categoryUseCase,required this.brandesUseCase}):super(InitalHomeTapCategory());
    void getAllCategory()async{
      var either =  await categoryUseCase.invoke();
      either.fold((l){
        emit(ErrorHomeTapCategory(ErrorMessage: l.errorMessage));
      }, (response){
        categoryList = response.data;
        emit(SussesHomeTapCategory(categoryEntity: response));
      });
    }

  void getAllBrandes()async{
    var either =  await brandesUseCase.invoke();
    either.fold((l){
      emit(ErrorHomeTapBrandes(errorMeassge: l.errorMessage));
    }, (response){
      brandesList = response.data;
      emit(SussesHomeTapBrandes(brandesResponseEntity: response));
    });
  }
}