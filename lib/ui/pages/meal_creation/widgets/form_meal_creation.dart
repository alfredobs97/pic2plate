// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pic_2_plate_ai/domain/cubit/meal/meal_cubit.dart';

class FormMealCreation extends StatelessWidget {
  final MealSettingsParameters state;

  FormMealCreation({required this.state, super.key});

  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  Text(
                    "How many people are you cooking for?",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Slider(
                    divisions: 3,
                    label: "${state.people} people",
                    value: state.people.toDouble(),
                    min: 1,
                    max: 4,
                    activeColor: Theme.of(context).colorScheme.secondary,
                    onChanged: (double value) => context.read<MealCubit>().setPeople(value.toInt()),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "How long do you want to cook?",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8.0),
                  SegmentedButton(
                    multiSelectionEnabled: false,
                    segments: const [
                      ButtonSegment(label: Text("15 m"), value: 15),
                      ButtonSegment(label: Text("30 m"), value: 30),
                      ButtonSegment(label: Text("45 m"), value: 45),
                      ButtonSegment(label: Text("60 m"), value: 60),
                    ],
                    selected: {state.maxTimeCooking},
                    onSelectionChanged: (selections) => context.read<MealCubit>().setMaxTimeCooking(selections.first),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Do you have any intolerances? (optional)",
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                style: Theme.of(context).textTheme.bodyLarge,
                onChanged: (String value) => context.read<MealCubit>().setIntolerances(value),
              ),
              Column(
                children: [
                  Text(
                    'Upload or take an ingredients picture',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8.0),
                  // const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FilledButton.tonalIcon(
                        icon: const Icon(Icons.photo_size_select_actual_rounded),
                        onPressed: () async {
                          final XFile? image = await picker.pickImage(source: ImageSource.gallery);

                          if (image == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Something went wrong'),
                              ),
                            );
                            return;
                          }

                          context.read<MealCubit>().setPicture(image);
                        },
                        label: Text(
                          "Open Gallery",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      FilledButton.tonalIcon(
                        label: Text(
                          "Take a Picture",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        onPressed: () async {
                          final XFile? image = await picker.pickImage(source: ImageSource.camera);

                          if (image == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Something went wrong'),
                              ),
                            );
                            return;
                          }

                          context.read<MealCubit>().setPicture(image);
                        },
                        icon: const Icon(Icons.camera_alt_rounded),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: ElevatedButton.icon(
            icon: Icon(Icons.set_meal_rounded, color: Theme.of(context).colorScheme.onPrimary),
            onPressed: state.isReadyToGenerate() ? () => context.read<MealCubit>().getMeal() : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              minimumSize: const Size(320, 50),
            ),
            label: Text(
              "Create My Meal",
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ),
      ],
    );
  }
}
