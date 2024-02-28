import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:pic_2_plate_ai/domain/cubit/meal/meal_cubit.dart';
import 'package:pic_2_plate_ai/ui/pages/meal_creation/widgets/form_meal_creation.dart';
import 'package:pic_2_plate_ai/ui/pages/meal_creation/widgets/loading_meal_widget.dart';

class MealCreationPage extends StatelessWidget {
  const MealCreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: BlocBuilder<MealCubit, MealState>(
        builder: (context, state) => Text(
          switch (state) {
            MealSettingsParameters() => 'Edit your receipt',
            MealLoading() => '',
            MealLoaded() => 'Your meal is ready',
            ErrorState() => 'Customize your receipt',
          },
          style: Theme.of(context).textTheme.titleLarge,
        ),
      )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<MealCubit, MealState>(
            builder: (context, state) => AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: switch (state) {
                MealSettingsParameters() => FormMealCreation(state: state),
                MealLoading() => const Center(child: LoadingMealWidget()),
                MealLoaded() => Markdown(data: state.meals.first),
                ErrorState() => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Something went wrong',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.error.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => context.read<MealCubit>().load(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                        ),
                        child: Text(
                          "Try again",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
              },
            ),
          ),
        ),
      ),
      floatingActionButton: BlocBuilder<MealCubit, MealState>(
        builder: (context, state) => switch (state) {
          MealLoaded() => FloatingActionButton(
              onPressed: () => context.read<MealCubit>().load(),
              child: const Icon(Icons.restart_alt_rounded),
            ),
          MealLoading() || MealSettingsParameters() || ErrorState() => const SizedBox(),
        },
      ),
    );
  }
}
