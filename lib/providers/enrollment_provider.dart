import 'package:flutter/foundation.dart';
import '../models/student.dart';
import '../models/course.dart';

class EnrollmentState extends ChangeNotifier {
  Student? _student;
  Course? _selectedCourse;

  // Getters
  Student? get student => _student;
  Course? get selectedCourse => _selectedCourse;

  // Check if student info is complete
  bool get hasStudentInfo => _student != null;

  // Check if course is selected
  bool get hasCourseSelected => _selectedCourse != null;

  // Check if enrollment is complete
  bool get isEnrollmentComplete => hasStudentInfo && hasCourseSelected;

  // Set student information
  void setStudent(Student student) {
    _student = student;
    notifyListeners();
  }

  // Set selected course
  void setSelectedCourse(Course course) {
    _selectedCourse = course;
    notifyListeners();
  }

  // Clear all enrollment data
  void clearEnrollment() {
    _student = null;
    _selectedCourse = null;
    notifyListeners();
  }

  // Update student info partially
  void updateStudent({
    String? firstName,
    String? lastName,
    String? email,
    String? studentID,
  }) {
    if (_student != null) {
      _student = _student!.copyWith(
        firstName: firstName,
        lastName: lastName,
        email: email,
        studentID: studentID,
      );
      notifyListeners();
    }
  }
}
