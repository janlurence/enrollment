class Course {
  final String id;
  final String name;
  final int credits;
  final String instructor;

  Course({
    required this.id,
    required this.name,
    required this.credits,
    required this.instructor,
  });

  Course copyWith({
    String? id,
    String? name,
    int? credits,
    String? instructor,
  }) {
    return Course(
      id: id ?? this.id,
      name: name ?? this.name,
      credits: credits ?? this.credits,
      instructor: instructor ?? this.instructor,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'credits': credits,
      'instructor': instructor,
    };
  }

  // Create from Map
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      credits: json['credits'],
      instructor: json['instructor'],
    );
  }

  @override
  String toString() {
    return 'Course{id: $id, name: $name, credits: $credits, instructor: $instructor}';
  }
}
