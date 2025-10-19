import 'package:equatable/equatable.dart';
import 'package:exercises/features/home/data/models/exercise_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<ExerciseModel> exercises;
  const HomeSuccess(this.exercises);
}

class HomeFailure extends HomeState {
  final String errormessage;
  const HomeFailure(this.errormessage);
}
