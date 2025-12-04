part of '../home_cubit.dart';

class _AppBottomNavBarCubit extends Cubit<int> {
  _AppBottomNavBarCubit() : super(0);

  void setIndex(int index) => emit(index);

  void onTap(TabsEnum tab) => emit(TabsEnum.values.indexOf(tab));
}
