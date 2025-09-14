import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riverpod/riverpod.dart';

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  void setIndex(int index) => emit(index);
}
