import 'package:contact_list_firestore/src/data/data.dart';
import 'package:contact_list_firestore/src/domain/domain.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteContactRepository implements ContactRepository {
  SqfliteContactRepository._();

  late final Database _database;

  static Future<SqfliteContactRepository> createInstance() async {
    final instance = SqfliteContactRepository._();
    await instance._initialize();
    return instance;
  }

  Future<void> _initialize() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'contacts_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE contacts(id INTEGER PRIMARY KEY AUTOINCREMENT, firstName TEXT, lastName TEXT, phoneNumber TEXT, email TEXT, birthDate INTEGER, company TEXT, position TEXT)',
        );
      },
      version: 1,
    );
  }

  @override
  Future<void> create(Contact contact) async {
    final dbContact = DatabaseContact.fromContact(contact);
    await _database.insert('contacts', dbContact.toMap());
  }

  @override
  Future<void> delete(Contact contact) async {
    await _database.delete(
      'contacts',
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  @override
  Future<List<Contact>> getAll() async {
    final result = await _database.query('contacts');
    final contacts = DatabaseContact.fromMapList(result);
    return contacts;
  }

  @override
  Future<void> update(Contact contact) async {
    final dbContact = DatabaseContact.fromContact(contact);
    await _database.update(
      'contacts',
      dbContact.toMap(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }
}
