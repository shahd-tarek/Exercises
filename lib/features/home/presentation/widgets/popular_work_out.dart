import 'package:flutter/material.dart';
import 'package:exercises/core/utils/styles.dart';
import 'package:exercises/core/utils/constants.dart';
import 'package:exercises/features/home/data/models/exercise_model.dart';

class PopularWorkoutsSection extends StatelessWidget {
  final List<ExerciseModel> exercises;
  final String Function(String) getMuscleImage;

  const PopularWorkoutsSection({
    super.key,
    required this.exercises,
    required this.getMuscleImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Popular Workouts",
          style: Styles.textStyle20.copyWith(
            fontWeight: FontWeight.bold,
            color: kTextColor,
          ),
        ),
        const SizedBox(height: 16),

        // 🔥 Horizontal ListView
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: exercises.take(4).length,
            itemBuilder: (context, index) {
              final ex = exercises[index];
              return Container(
                width: 200,
                margin: const EdgeInsets.only(right: 16, bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Image.asset(
                        getMuscleImage(ex.muscle),
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: 80,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.6),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ex.name,
                              style: Styles.textStyle16.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Difficulty: ${ex.difficulty}",
                              style: Styles.textStyle16.copyWith(
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
