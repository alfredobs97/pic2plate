import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_2_plate_ai/data/repository/gemini_meal_repository.dart';
import 'package:pic_2_plate_ai/domain/cubit/meal/meal_cubit.dart';
import 'package:pic_2_plate_ai/ui/pages/meal_creation/meal_creation_page.dart';
import 'package:pic_2_plate_ai/ui/pages/onboarding/onboarding_page.dart';

abstract class RoutesNames {
  static const String onboarding = '/';
  static const String mealCreation = '/meal-creation';
}

class AppRouter {
  static String getNestedRouteName() {
    return RoutesNames.onboarding;
  }

  final mealCubit = MealCubit(GeminiMealRepository());

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case RoutesNames.mealCreation:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: mealCubit,
            child: const MealCreationPage(),
          ),
        );
      default:
        throw StateError('Route not found');
    }
  }
}
