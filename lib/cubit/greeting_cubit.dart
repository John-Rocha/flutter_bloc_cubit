import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'greeting_state.dart';

class GreetingCubit extends Cubit<GreetingState> {
  int howManyTimes = 1;

  GreetingCubit() : super(GreetingInitial());

  Future<void> nextGreetingState() async {
    howManyTimes++;
    if (howManyTimes == 2) {
      emit(GreetingSecondTime());
    } else if (howManyTimes == 3) {
      emit(GreetingThirdTime());
    } else {
      emit(GreetingThereAfter());
    }
  }

  Future<void> resetCounting() async {
    howManyTimes = 1;
    emit(GreetingInitial());
  }
}
