import 'package:exercises/core/utils/constants.dart';
import 'package:exercises/core/utils/styles.dart';
import 'package:exercises/features/workout/data/cubit/workout_cubit.dart';
import 'package:exercises/features/workout/data/cubit/workout_state.dart';
import 'package:exercises/features/workout/presentation/views/workout_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutBody extends StatefulWidget {
  const WorkoutBody({super.key});

  @override
  State<WorkoutBody> createState() => _WorkoutBodyState();
}

class _WorkoutBodyState extends State<WorkoutBody> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WorkoutCubit>();
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "choose muslce (biceps, chest...)",
              suffixIcon: IconButton(
                onPressed: () {
                  cubit.searchByMuscle(controller.text.trim());
                },
                icon: Icon(Icons.search),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: kPrimaryColor, width: 2),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: BlocBuilder<WorkoutCubit, WorkoutState>(
              builder: (context, state) {
                if (state is WorkoutLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is WorkoutLoaded) {
                  return ListView.builder(
                    itemCount: state.exercises.length,
                    itemBuilder: (context, index) {
                      final ex = state.exercises[index];

                      return Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  getMuscleImage(ex.muscle),
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 16),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      ex.name,
                                      style: Styles.textStyle16.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      ex.difficulty,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              IconButton(
                                onPressed: () {
                                  final imagePath = getMuscleImage(ex.muscle);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) => ExerciseDetails(
                                            exercise: ex,
                                            imagePath: imagePath,
                                          ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.play_circle_fill,
                                  color: kPrimaryColor,
                                  size: 36,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is WorkoutError) {
                  return Center(child: Text(state.errmessage));
                }
                return const Center(child: Text("Search for an exercise"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
