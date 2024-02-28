import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:pic_2_plate_ai/domain/repository/meal_repository.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  static final initialState = MealSettingsParameters(
    people: 1,
    maxTimeCooking: 15,
    intoleranceOrLimits: null,
    picture: null,
  );

  final AbstractMealRepository mealRepository;

  MealCubit(this.mealRepository) : super(initialState);

  void load() {
    emit(initialState);
  }

  void setPeople(int people) {
    switch (state) {
      case MealSettingsParameters():
        emit((state as MealSettingsParameters).copyWith(people: people));

        break;
      default:
    }
  }

  void setMaxTimeCooking(int maxTimeCooking) {
    switch (state) {
      case MealSettingsParameters():
        emit((state as MealSettingsParameters).copyWith(maxTimeCooking: maxTimeCooking));
        break;
      default:
    }
  }

  // set intolerances
  void setIntolerances(String intolerances) {
    switch (state) {
      case MealSettingsParameters():
        emit((state as MealSettingsParameters)
            .copyWith(intoleranceOrLimits: intolerances.isEmpty ? null : intolerances));

        break;
      default:
    }
  }

  // set picture
  void setPicture(XFile image) {
    switch (state) {
      case MealSettingsParameters():
        emit((state as MealSettingsParameters).copyWith(picture: image));

        break;
      default:
    }
  }

  void getMeal() async {
    switch (state) {
      case MealSettingsParameters():
        try {
          final mealParameters = state as MealSettingsParameters;
          emit(MealLoading());
          final meals = await mealRepository.getMeals(mealParameters);
          emit(MealLoaded(meals: meals));
        } catch (e) {
          emit(ErrorState(e));
        }

        break;
      default:
    }
  }
}
