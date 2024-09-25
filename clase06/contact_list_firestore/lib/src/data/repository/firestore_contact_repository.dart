import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_list_firestore/src/data/data.dart';
import 'package:contact_list_firestore/src/domain/domain.dart';

class FirestoreContactRepository implements ContactRepository {
  final _firestoreDatabase = FirebaseFirestore.instance;

  @override
  Future<void> create(Contact contact) async {
    final dbContact = FirestoreContact.fromContact(
      contact.copyWith(
        id: DateTime.now().millisecondsSinceEpoch,
      ),
    );
    await _firestoreDatabase
        .collection('contacts')
        .doc(dbContact.id.toString())
        .set(dbContact.toMap());
  }

  @override
  Future<void> delete(Contact contact) async {
    await _firestoreDatabase
        .collection('contacts')
        .doc(contact.id.toString())
        .delete();
  }

  @override
  Future<List<Contact>> getAll() async {
    final snapshot = await _firestoreDatabase.collection('contacts').get();

    final contacts = snapshot.docs
        .map((document) => FirestoreContact.fromMap(
              document.data(),
              documentId: document.id,
            ))
        .toList();

    return contacts;
  }

  @override
  Future<void> update(Contact contact) async {
    await _firestoreDatabase
        .collection('contacts')
        .doc(contact.id.toString())
        .update(FirestoreContact.fromContact(contact).toMap());
  }
}
