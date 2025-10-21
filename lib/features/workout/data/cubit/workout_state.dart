import 'package:equatable/equatable.dart';
import 'package:exercises/features/home/data/models/exercise_model.dart';

abstract class WorkoutState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WorkoutInitial extends WorkoutState {}

class WorkoutLoading extends WorkoutState {}

class WorkoutLoaded extends WorkoutState {
  final List<ExerciseModel> exercises;
  WorkoutLoaded(this.exercises);
}

class WorkoutError extends WorkoutState {
  final String errmessage;
  WorkoutError(this.errmessage);
}
