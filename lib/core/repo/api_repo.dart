import 'package:dio/dio.dart';
import 'package:exercises/features/home/data/models/exercise_model.dart';

class ApiRepo {
  final Dio dio;
  final baseUrl = "https://api.api-ninjas.com/v1/";
  final String apiKey = "J0wInoXiBwfR2dfcXRJ6cA==ruLt8yatbkZB2Yrq";
  ApiRepo(this.dio);

  Future<List<ExerciseModel>> getExercises({String? muscle}) async {
    try {
      final endpoint =
          muscle == null || muscle.isEmpty
              ? "${baseUrl}exercises"
              : "${baseUrl}exercises?muscle=$muscle";

      final response = await dio.get(
        endpoint,
        options: Options(headers: {"X-Api-Key": apiKey}),
      );
      if (response.statusCode == 200) {
        final data = response.data as List;
        return data.map((e) => ExerciseModel.fromJson(e)).toList();
      } else {
        throw Exception("Failed to load exercises");
      }
    } catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
  }
}
