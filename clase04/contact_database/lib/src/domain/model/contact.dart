class Contact {
  Contact({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.birthDate,
    this.company,
    this.position,
  });

  final int? id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final DateTime birthDate;
  final String? company;
  final String? position;

  String get fullName => '$firstName $lastName';

  String get initials => '${firstName[0]}${lastName[0]}';

  Contact copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
    DateTime? birthDate,
    String? company,
    String? position,
  }) =>
      Contact(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        birthDate: birthDate ?? this.birthDate,
        company: company ?? this.company,
        position: position ?? this.position,
      );
}
