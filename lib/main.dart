import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pic_2_plate_ai/ui/app_router.dart';
import 'package:pic_2_plate_ai/ui/theme/app_theme.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pic2Plate AI',
      theme: AppTheme.getLight(),
      initialRoute: AppRouter.getNestedRouteName(),
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
