import 'package:contact_list_domain/domain.dart';

class DatabaseContact extends Contact {
  DatabaseContact({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.phoneNumber,
    required super.email,
    required super.birthDate,
    required super.company,
    required super.position,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'email': email,
        'birthDate': birthDate.millisecondsSinceEpoch,
        'company': company,
        'position': position,
      };

  factory DatabaseContact.fromMap(Map<String, dynamic> map) => DatabaseContact(
        id: map['id'],
        firstName: map['firstName'],
        lastName: map['lastName'],
        phoneNumber: map['phoneNumber'],
        email: map['email'],
        birthDate: DateTime.fromMillisecondsSinceEpoch(map['birthDate']),
        company: map['company'],
        position: map['position'],
      );

  factory DatabaseContact.fromContact(Contact contact) => DatabaseContact(
        id: contact.id,
        firstName: contact.firstName,
        lastName: contact.lastName,
        phoneNumber: contact.phoneNumber,
        email: contact.email,
        birthDate: contact.birthDate,
        company: contact.company,
        position: contact.position,
      );

  static List<Contact> fromMapList(List<Map<String, dynamic>> maps) {
    final result = <Contact>[];

    for (dynamic map in maps) {
      result.add(DatabaseContact.fromMap(map));
    }

    return result;
  }
}
