import 'package:contact_list_firestore/src/domain/model/contact.dart';
import 'package:contact_list_firestore/src/domain/repository/contact_repository.dart';

class InMemoryContactRepository implements ContactRepository {
  final _contacts = <int, Contact>{};

  @override
  Future<void> create(Contact contact) async {
    final contactWithId = contact.copyWith(
      id: DateTime.now().millisecondsSinceEpoch,
    );
    _contacts[contactWithId.id!] = contactWithId;
  }

  @override
  Future<void> delete(Contact contact) async {
    _contacts.remove(contact.id!);
  }

  @override
  Future<List<Contact>> getAll() async {
    return _contacts.values.toList();
  }

  @override
  Future<void> update(Contact contact) async {
    _contacts[contact.id!] = contact;
  }
}
