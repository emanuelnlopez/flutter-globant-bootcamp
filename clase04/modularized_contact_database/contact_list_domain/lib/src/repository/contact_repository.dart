import 'package:contact_list_domain/domain.dart';

abstract class ContactRepository {
  Future<void> create(Contact contact);

  Future<List<Contact>> getAll();

  Future<void> update(Contact contact);

  Future<void> delete(Contact contact);
}
