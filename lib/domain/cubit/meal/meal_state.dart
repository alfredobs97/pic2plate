part of 'meal_cubit.dart';

@immutable
sealed class MealState {}

final class MealSettingsParameters extends MealState {
  final int people;
  final int maxTimeCooking;
  final String? intoleranceOrLimits;
  final XFile? picture;

  MealSettingsParameters({
    required this.people,
    required this.maxTimeCooking,
    required this.intoleranceOrLimits,
    required this.picture,
  });

  MealSettingsParameters copyWith({
    int? people,
    int? maxTimeCooking,
    String? intoleranceOrLimits,
    XFile? picture,
  }) =>
      MealSettingsParameters(
        people: people ?? this.people,
        maxTimeCooking: maxTimeCooking ?? this.maxTimeCooking,
        intoleranceOrLimits: intoleranceOrLimits ?? this.intoleranceOrLimits,
        picture: picture ?? this.picture,
      );

  bool isReadyToGenerate() => picture != null;

  @override
  String toString() {
    return 'MealSettingsParameters(people: $people, maxTimeCooking: $maxTimeCooking, intoleranceOrLimits: $intoleranceOrLimits, picture: $picture)';
  }
}

final class MealLoading extends MealState {}

final class MealLoaded extends MealState {
  final List<String> meals;

  MealLoaded({required this.meals});

  @override
  String toString() => 'MealLoaded(meals: $meals)';
}

final class ErrorState extends MealState {
  final dynamic error;

  ErrorState(this.error);

  @override
  String toString() => 'MealError(message: $error)';
}
