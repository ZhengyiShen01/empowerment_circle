import 'package:contacts_service/contacts_service.dart';

Future<List<String>?> fetchContact() async {
  // Fetch contacts using ContactsService
  List<Contact> contacts =
      await ContactsService.getContacts(withThumbnails: false);
  print('Contacts: $contacts');

  return ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  // Map contacts to ContactsStruct objects, handling null cases
  // return contacts.map((contact) {
  //   String? phoneNumber = contact.phones?.first.value
  //       ?.trim()
  //       .replaceAll(new RegExp(r'[^\w\s]+'), '');

  //   // Handle null cases for phone number and display name
  //   if (phoneNumber == null) {
  //     return ''; // Omit contacts with missing data
  //   }

  //   return phoneNumber;
  // }).toList();
}
