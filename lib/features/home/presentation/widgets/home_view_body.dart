import 'package:exercises/core/utils/constants.dart';
import 'package:exercises/core/utils/styles.dart';
import 'package:exercises/features/home/data/cubit/home_cubit.dart';
import 'package:exercises/features/home/data/cubit/home_state.dart';
import 'package:exercises/features/home/presentation/widgets/popular_work_out.dart';
import 'package:exercises/features/home/presentation/widgets/today_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackground,
        elevation: 0,
        title: Text(
          "Good Morning 🔥",
          style: Styles.textStyle20.copyWith(
            fontWeight: FontWeight.bold,
            color: kTextColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeFailure) {
                return Center(
                  child: Text(
                    state.errormessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              } else if (state is HomeSuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PopularWorkoutsSection(
                              exercises: state.exercises,
                              getMuscleImage: getMuscleImage,
                            ),

                            const SizedBox(height: 24),

                            TodayPlanList(exercises: state.exercises),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<HomeCubit>().getExercises();
                  },
                  child: const Text("Load Exercises"),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
