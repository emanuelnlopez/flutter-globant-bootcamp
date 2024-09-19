import 'package:contact_database/src/domain/domain.dart';

abstract class ContactRepository {
  Future<void> create(Contact contact);

  Future<List<Contact>> getAll();

  Future<void> update(Contact contact);

  Future<void> delete(Contact contact);
}
