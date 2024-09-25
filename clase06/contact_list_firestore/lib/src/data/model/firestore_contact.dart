import 'package:contact_list_firestore/src/domain/domain.dart';

class FirestoreContact extends Contact {
  FirestoreContact({
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
        'id': id.toString(),
        'firstName': firstName.toString(),
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'email': email,
        'birthDate': birthDate.millisecondsSinceEpoch,
        'company': company,
        'position': position,
      };

  static FirestoreContact fromMap(
    Map<String, dynamic> map, {
    required String documentId,
  }) =>
      FirestoreContact(
        id: int.parse(documentId),
        firstName: map['firstName'],
        lastName: map['lastName'],
        phoneNumber: map['phoneNumber'],
        email: map['email'],
        birthDate: DateTime.fromMillisecondsSinceEpoch(map['birthDate']),
        company: map['company'],
        position: map['position'],
      );

  factory FirestoreContact.fromContact(Contact contact) => FirestoreContact(
        id: contact.id,
        firstName: contact.firstName,
        lastName: contact.lastName,
        phoneNumber: contact.phoneNumber,
        email: contact.email,
        birthDate: contact.birthDate,
        company: contact.company,
        position: contact.position,
      );
}
