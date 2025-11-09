import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import '../providers/enrollment_provider.dart';

class CourseSelectionScreen extends StatelessWidget {
  const CourseSelectionScreen({super.key});

  // Hard-coded list of available courses
  static final List<Course> _availableCourses = [
    Course(
      id: 'MD101',
      name: 'Mobile Development',
      credits: 4,
      instructor: 'Sir Adhz',
    ),
    Course(
      id: 'IM2',
      name: 'Information Management 2',
      credits: 3,
      instructor: 'Sir Gene',
    ),
    Course(
      id: 'SOFTENG1',
      name: 'Software Engineering',
      credits: 3,
      instructor: 'Mrs. Petralba',
    ),
    Course(
      id: 'REED3',
      name: 'Recoletos Education',
      credits: 3,
      instructor: 'Sir Jake',
    ),
    Course(
      id: 'TECNO1',
      name: 'Technoprenurship',
      credits: 3,
      instructor: 'Sir Jame',
    ),
  ];

  void _selectCourse(BuildContext context, Course course) {
    Provider.of<EnrollmentState>(
      context,
      listen: false,
    ).setSelectedCourse(course);

    Navigator.pushNamed(context, '/enrollment-review');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select a Course')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Available Courses',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Select one course to enroll in',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _availableCourses.length,
              padding: const EdgeInsets.all(8.0),
              itemBuilder: (context, index) {
                final course = _availableCourses[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  elevation: 2,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      child: Text(
                        '${course.credits}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(
                      course.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          'Course ID: ${course.id}',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Instructor: ${course.instructor}',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Credits: ${course.credits}',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => _selectCourse(context, course),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
