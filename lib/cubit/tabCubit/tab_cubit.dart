import 'package:block_cubit/cubit/tabCubit/tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit() : super(PowScreenState());

  int tabIndex = 0;

  updateScreen({required int index}) {

    if (index == 0) {
      tabIndex = index;
      print("Farruxxxxxxxx   $index");
      emit(PowScreenState());
    } else {
      tabIndex = index;
      print("Farruxxxxxxxx   $index");
      emit(LoginScreenState());
    }
  }
}