
import 'package:exercises/features/home/data/models/exercise_model.dart';
import 'package:exercises/features/workout/data/cubit/workout_cubit.dart';
import 'package:exercises/features/workout/data/cubit/workout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkOutBody extends StatefulWidget {
  const WorkOutBody({super.key});

  @override
  State<WorkOutBody> createState() => _WorkOutBodyState();
}

class _WorkOutBodyState extends State<WorkOutBody> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WorkoutCubit>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: "Enter muscle (biceps, chest...)",
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  cubit.searchByMuscle(_controller.text.trim());
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<WorkoutCubit, WorkoutState>(
              builder: (context, state) {
                if (state is WorkoutLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is WorkoutLoaded) {
                  if (state.exercises.isEmpty) {
                    return const Center(child: Text("No exercises found"));
                  }
                  return ListView.builder(
                    itemCount: state.exercises.length,
                    itemBuilder: (context, index) {
                      final ex = state.exercises[index];
                      return ListTile(
                        title: Text(ex.name),
                        subtitle: Text("${ex.muscle} • ${ex.difficulty}"),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ExerciseDetails(exercise: ex),
                            ),
                          );
                        },
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

class ExerciseDetails extends StatelessWidget {
  final ExerciseModel exercise;

  const ExerciseDetails({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exercise.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          exercise.instructions,
          style: const TextStyle(fontSize: 16, height: 1.5),
        ),
      ),
    );
  }
}
