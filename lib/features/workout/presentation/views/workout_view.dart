import 'package:exercises/core/utils/constants.dart';
import 'package:exercises/core/utils/styles.dart';
import 'package:exercises/features/workout/data/cubit/workout_cubit.dart';
import 'package:exercises/features/workout/data/repo/workout_repo.dart';
import 'package:exercises/features/workout/presentation/widgets/workout_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';


class WorkOutView extends StatelessWidget {
  const WorkOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WorkoutCubit(WorkoutRepo(Dio())),
      child: Scaffold(
        appBar: AppBar(
          title:Text("Workout Search",style: Styles.textStyle20.copyWith(
            fontWeight: FontWeight.bold,
            color: kTextColor,
          ),),
          backgroundColor: kBackground,
        ),
        body: const WorkOutBody(),
      ),
    );
  }
}
