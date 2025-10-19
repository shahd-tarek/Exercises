import 'package:exercises/core/repo/api_repo.dart';
import 'package:exercises/features/home/data/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repo) : super(HomeInitial());
  final ApiRepo repo;
  Future<void> getExercises({String? muscle}) async {
    emit(HomeLoading());
    try {
      final exercises = await repo.getExercises(muscle: muscle);
      emit(HomeSuccess(exercises));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
