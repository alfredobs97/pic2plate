import 'package:pic_2_plate_ai/domain/cubit/meal/meal_cubit.dart';

abstract class AbstractMealRepository {
  Future<List<String>> getMeals(MealSettingsParameters parameters);
}
