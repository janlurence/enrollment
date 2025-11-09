class Student {
  final String firstName;
  final String lastName;
  final String email;
  final String studentID;

  Student({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.studentID,
  });

  Student copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? studentID,
  }) {
    return Student(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      studentID: studentID ?? this.studentID,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'studentID': studentID,
    };
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      studentID: json['studentID'],
    );
  }

  @override
  String toString() {
    return 'Student{firstName: $firstName, lastName: $lastName, email: $email, studentID: $studentID}';
  }
}
