import 'package:dio/dio.dart';
import 'package:exercises/features/home/data/models/exercise_model.dart';

class WorkoutRepo {
  final Dio dio;
  final String apiKey = "J0wInoXiBwfR2dfcXRJ6cA==ruLt8yatbkZB2Yrq";

  WorkoutRepo(this.dio);

  Future <List<ExerciseModel>> fetchExercisesByMuscle(String muscle) async{
    try{
      final response = await dio.get(
        'https://api.api-ninjas.com/v1/exercises',
         queryParameters: {'muscle': muscle},
        options: Options(headers: {'X-Api-Key': apiKey}),
      );
      final List data = response.data;
      return data.map((e) => ExerciseModel.fromJson(e)).toList();
    }catch(e){
     throw Exception('Failed to load exercises: $e');
    }

  }

}
