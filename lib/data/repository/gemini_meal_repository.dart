import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:pic_2_plate_ai/domain/cubit/meal/meal_cubit.dart';
import 'package:pic_2_plate_ai/domain/repository/meal_repository.dart';

class GeminiMealRepository extends AbstractMealRepository {
  final apiKey = dotenv.env['PALM_API_KEY'];

  @override
  Future<List<String>> getMeals(MealSettingsParameters parameters) async {
    final model = GenerativeModel(
      model: 'gemini-pro-vision',
      apiKey: apiKey!,
    );

    final prompt = _generatePrompt(parameters);
    final image = await parameters.picture!.readAsBytes();
    final mimetype = parameters.picture!.mimeType ?? 'image/jpeg';

    final response = await model.generateContent([
      Content.multi([TextPart(prompt), DataPart(mimetype, image)])
    ]);

   // return response.skipWhile((response) => response.text != null).map((event) => event.text!);

    return [response.text!];
  }

  String _generatePrompt(MealSettingsParameters parameters) {
    String prompt =
        '''You are a very experienced diet Planner. I want to have a 3 options for a meal using only the ingredients in the picture. 
  I need the receipt step by step to easily understand it and format me using only markdown. 
  I want the quantity of the ingredients for ${parameters.people.toString()} people and I only want to spend a maximum of ${parameters.maxTimeCooking.toString()} minutes to make the meal.
  ''';

    if (parameters.intoleranceOrLimits != null) {
      prompt += 'I have the following intolerances or limits: ${parameters.intoleranceOrLimits}';
    }

    return prompt;
  }
}
