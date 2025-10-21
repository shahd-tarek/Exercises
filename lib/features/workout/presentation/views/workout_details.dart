import 'package:exercises/core/utils/constants.dart';
import 'package:exercises/core/utils/styles.dart';
import 'package:exercises/features/home/data/models/exercise_model.dart';
import 'package:flutter/material.dart';

class ExerciseDetails extends StatelessWidget {
  final ExerciseModel exercise;
  final String imagePath;

  const ExerciseDetails({
    super.key,
    required this.exercise,
    required this.imagePath,
  });
  List<String> _splitInstructions(String text) {
    return text.split('.').where((line) => line.trim().isNotEmpty).toList();
  }

  @override
  Widget build(BuildContext context) {
    final steps = _splitInstructions(exercise.instructions);
    return Scaffold(
      appBar: AppBar(title: Text(exercise.name), backgroundColor: kBackground),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Instructions",
                    style: Styles.textStyle18.copyWith(height: 1.5),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ...steps.map(
                (step) => Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      step.trim(),
                      style: Styles.textStyle16.copyWith(height: 1.6),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
