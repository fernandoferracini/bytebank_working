import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import '../app_database.dart';

class ContactDao {
  static const String tableContacts = 'CREATE TABLE $_nameTableContacts('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_account_number INTEGER)';

  static const String _nameTableContacts = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _account_number = 'account_number';

  Future<int> save(Contact contact) async {
    final Database db = await (getDatabase());
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_nameTableContacts, contactMap);
  }

  Future<int> update(Contact contact) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> contactMap = _toMap(contact);
    return db.update(
      _nameTableContacts,
      contactMap,
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<int> delete(int id) async {
    final Database db = await getDatabase();
    return db.delete(
      _nameTableContacts,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.name;
    contactMap[_account_number] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await (getDatabase());
    final List<Map<String, dynamic>> result =
        await db.query(_nameTableContacts);
    List<Contact> contacts = _toList(result);
    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = List();
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[_id],
        row[_name],
        row[_account_number],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
