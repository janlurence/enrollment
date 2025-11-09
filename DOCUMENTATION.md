# Student Enrollment App

A Flutter application that simulates enrolling in a college course. This app demonstrates advanced Flutter concepts including multi-step forms, state management with Provider, named routes, and form validation.

## 📱 Features

- **Multi-step enrollment process** across 3 screens
- **Form validation** for all user inputs
- **Global state management** using Provider
- **Named routes** for navigation
- **Clean separation of concerns** between data models, state management, and UI

## 🏗️ Project Structure

```
lib/
├── main.dart                           # App entry point with Provider setup and routes
├── models/                             # Data models
│   ├── student.dart                    # Student model (firstName, lastName, email, studentID)
│   └── course.dart                     # Course model (id, name, credits, instructor)
├── providers/                          # State management
│   └── enrollment_provider.dart        # Global EnrollmentState using ChangeNotifier
└── screens/                            # UI screens
    ├── student_info_form_screen.dart   # Screen 1: Student information form
    ├── course_selection_screen.dart    # Screen 2: Course selection
    └── enrollment_review_screen.dart   # Screen 3: Enrollment review and confirmation
```

## 🎯 How It Meets Requirements

### 1. Data Models ✅
- **Student Model** (`lib/models/student.dart`): Contains firstName, lastName, email, studentID
- **Course Model** (`lib/models/course.dart`): Contains id, name, credits, instructor
- Both models include `copyWith()`, `toJson()`, and `fromJson()` methods

### 2. Three Core Screens ✅

#### Screen 1: Student Info Form (`/`)
- Collects student information with 4 required fields
- **Form Validation**: 
  - First Name: Required, minimum 2 characters
  - Last Name: Required, minimum 2 characters
  - Email: Required, valid email format
  - Student ID: Required, minimum 5 characters
- **State Management**: Uses local `TextEditingController` and stores to global state on submit
- **Navigation**: Routes to `/course-selection` after validation

#### Screen 2: Course Selection (`/course-selection`)
- Displays 5 hard-coded courses using `ListView.builder`
- Shows course ID, name, credits, and instructor for each option
- **Global State Update**: Updates `EnrollmentState` with selected course
- **Navigation**: Routes to `/enrollment-review` when course is selected

#### Screen 3: Enrollment Review (`/enrollment-review`)
- Displays all collected student and course information
- Uses `Consumer<EnrollmentState>` to read global state
- **Confirmation**: Shows success dialog and clears state
- **Navigation**: Returns to home (`/`) after confirmation

### 3. Application Flow ✅

```
Start → Screen 1 (Student Info)
  ↓ (validates all fields)
Screen 2 (Course Selection)
  ↓ (selects a course)
Screen 3 (Enrollment Review)
  ↓ (confirms enrollment)
Success Dialog → Clear State → Back to Screen 1
```

### 4. Technical Requirements ✅

#### State Management: Provider
- `EnrollmentState` class extends `ChangeNotifier`
- Wraps entire app in `ChangeNotifierProvider`
- Manages global `Student` and `Course` objects
- Methods: `setStudent()`, `setSelectedCourse()`, `clearEnrollment()`
- Screen 3 uses `Consumer<EnrollmentState>` to reactively display data

#### Routing: Named Routes
- All routes defined in `MaterialApp.routes`
- Routes:
  - `/` → `StudentInfoFormScreen`
  - `/course-selection` → `CourseSelectionScreen`
  - `/enrollment-review` → `EnrollmentReviewScreen`
- Uses `Navigator.pushNamed()` for navigation

#### Form Validation
- Custom validators for each field type
- `_validateName()`: Checks for empty and minimum length
- `_validateEmail()`: Uses regex for email format
- `_validateStudentID()`: Checks for empty and minimum length
- Global form key for validation before navigation

#### Separation of Concerns
- **Models**: Pure data classes in `lib/models/`
- **State**: Business logic in `lib/providers/`
- **UI**: Screens in `lib/screens/`
- No business logic in widgets

## 🚀 Getting Started

### Prerequisites
- Flutter SDK installed
- An IDE (VS Code, Android Studio, etc.)

### Installation

1. Clone the repository
2. Navigate to the project directory
3. Get dependencies:
   ```bash
   flutter pub get
   ```

### Running the App

```bash
flutter run
```

## 📦 Dependencies

- `flutter`: SDK
- `provider: ^6.1.1`: State management
- `cupertino_icons: ^1.0.8`: iOS-style icons

## 🎨 UI/UX Features

- **Material Design 3** with custom color scheme
- **Form validation feedback** with error messages
- **Card-based layouts** for better visual hierarchy
- **Success dialog** with confirmation message
- **Responsive layouts** with `SingleChildScrollView`
- **Icon integration** for visual cues

## 🧪 Testing the App

### Test Flow:
1. **Launch app** → See Student Info Form screen
2. **Try submitting empty form** → See validation errors
3. **Fill in all fields** with valid data
4. **Click "Continue to Course Selection"** → Navigate to Course Selection
5. **Select a course** → Navigate to Enrollment Review
6. **Review information** → Verify all data is displayed correctly
7. **Click "Confirm Enrollment"** → See success dialog
8. **Click "OK"** → Return to Student Info Form with cleared state

### Edge Cases Handled:
- Empty form submission
- Invalid email format
- Short names or IDs
- Navigation without completing forms (Review screen handles missing data)
- State persistence across navigation
- State clearing after confirmation

## 📝 Code Quality

- Follows Flutter best practices
- Uses `const` constructors where possible
- Proper disposal of `TextEditingController`s
- No lint errors or warnings
- Clean, readable code with comments

## 🎓 Learning Outcomes

This project demonstrates:
- Multi-step form handling
- Global state management with Provider
- Navigation with data passing
- Form validation techniques
- Separation of concerns architecture
- Material Design implementation
- Consumer pattern for reactive UI updates

---

**Author**: Midterm Exam Project  
**Date**: November 2025  
**Framework**: Flutter 3.9.2
