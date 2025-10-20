import 'package:exercises/features/workout/data/cubit/workout_state.dart';
import 'package:exercises/features/workout/data/repo/workout_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit(this.repo) : super(WorkoutInitial());
  final WorkoutRepo repo;

  void searchByMuscle(String muscle) async {
    if (muscle.isEmpty) return;
    emit(WorkoutLoading());
    try {
      final exercises = await repo.fetchExercisesByMuscle(muscle);
      emit(WorkoutLoaded(exercises));
    } catch (errmessage) {
      emit(WorkoutError(errmessage.toString()));
    }
  }
}
