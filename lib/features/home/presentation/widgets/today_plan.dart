import 'package:exercises/core/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:exercises/core/utils/styles.dart';
import 'package:exercises/features/home/data/models/exercise_model.dart';

class TodayPlanList extends StatelessWidget {
  final List<ExerciseModel> exercises;

  const TodayPlanList({super.key, required this.exercises});
  String getMuscleImage(String muscle) {
    switch (muscle.toLowerCase()) {
      case 'biceps':
        return 'assets/images/biceps.jpg';
      case 'chest':
        return 'assets/images/chest.jpg';
      case 'legs':
        return 'assets/images/legs.jpg';
      default:
        return 'assets/images/default.jpg';
    }
  }

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
            return SizedBox(
              height: 100,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      getMuscleImage(ex.muscle),
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    ex.name,
                    style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Difficulty: ${ex.difficulty}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: const Icon(
                    Icons.play_circle_fill,
                    color: kPrimaryColor,
                    size: 30,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
