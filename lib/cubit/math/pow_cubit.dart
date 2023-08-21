import 'package:block_cubit/cubit/math/pow_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PowCubit extends Cubit<PowState>{
  PowCubit() : super(PowState());

  void numberA(int a){
    emit(state.copyWith(a: a));
  }
  void numberB(int b){
    emit(state.copyWith(b: b));
  }
  void answer(){
    int ans=1;
    for(int i=0;i<state.b;i++){
      ans=ans*state.a;
    }
    emit(state.copyWith(answer: ans));
  }
}