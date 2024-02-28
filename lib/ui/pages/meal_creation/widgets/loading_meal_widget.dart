import 'package:flutter/material.dart';

class LoadingMealWidget extends StatelessWidget {
  const LoadingMealWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Gemini AI is creating your custom receipt', style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        const SizedBox(height: 8),
        Text('This may take a few seconds...', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 32),
        const LinearProgressIndicator()
      ],
    );
  }
}