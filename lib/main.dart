import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/enrollment_provider.dart';
import 'screens/student_info_form_screen.dart';
import 'screens/course_selection_screen.dart';
import 'screens/enrollment_review_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color usjrGold = Color(0xFFFFD700); // Gold
  static const Color usjrDarkGreen = Color(0xFF1B4D3E); // Dark Green

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EnrollmentState(),
      child: MaterialApp(
        title: 'Student Enrollment App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: usjrDarkGreen,
            primary: usjrDarkGreen,
            secondary: usjrGold,
          ),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: usjrDarkGreen,
            foregroundColor: usjrGold,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: usjrDarkGreen,
              foregroundColor: usjrGold,
            ),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: usjrDarkGreen,
            foregroundColor: usjrGold,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const StudentInfoFormScreen(),
          '/course-selection': (context) => const CourseSelectionScreen(),
          '/enrollment-review': (context) => const EnrollmentReviewScreen(),
        },
      ),
    );
  }
}
