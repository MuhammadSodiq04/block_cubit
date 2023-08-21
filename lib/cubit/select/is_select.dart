import 'package:flutter_bloc/flutter_bloc.dart';

class IsSelect extends Cubit<bool>{
  IsSelect(super.initialState);
  bool isSelect = false;

  selected(){
    isSelect=!isSelect;
  }
}