import 'package:exercises/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:exercises/core/utils/styles.dart';
import 'package:exercises/features/home/data/models/exercise_model.dart';

class TodayPlanList extends StatelessWidget {
  final List<ExerciseModel> exercises;

  const TodayPlanList({super.key, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today Plan",
          style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ListView.builder(
          itemCount: exercises.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final ex = exercises[index];
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
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.play_circle_fill,
                      color: kPrimaryColor,
                      size: 36,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
