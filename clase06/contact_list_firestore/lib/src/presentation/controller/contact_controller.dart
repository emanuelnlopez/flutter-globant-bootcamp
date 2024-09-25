import 'dart:async';

import 'package:contact_list_firestore/src/domain/domain.dart';

abstract class Disposable {
  void dispose();
}

class ContactController implements Disposable {
  ContactController({required ContactRepository contactRepository})
      : _contactRepository = contactRepository;

  final ContactRepository _contactRepository;
  final _contactStreamController = StreamController<List<Contact>>.broadcast();

  Stream<List<Contact>> get contactStream => _contactStreamController.stream;

  void getAll() async {
    try {
      final contacts = await _contactRepository.getAll();
      _contactStreamController.add(contacts);
    } catch (error) {
      _contactStreamController.addError(error);
    }
  }

  @override
  void dispose() {
    _contactStreamController.close();
  }

  Future<void> delete(Contact contact) async {
    await _contactRepository.delete(contact);
    getAll();
  }

  Future<void> save(Contact contact) async {
    if (contact.id == null) {
      await _contactRepository.create(contact);
    } else {
      await _contactRepository.update(contact);
    }
    getAll();
  }
}
