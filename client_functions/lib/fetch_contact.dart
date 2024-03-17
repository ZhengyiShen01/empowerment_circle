import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

Future<List<String>?> fetchContact() async {
  // Fetch contacts using ContactsService
  if (await Permission.contacts.request().isGranted) {
    List<Contact> contacts =
        await ContactsService.getContacts(withThumbnails: false);

    return contacts
        .map((contact) {
          List<dynamic>? contactPhones = contact.phones;
          if (contactPhones == null || contactPhones.length == 0) {
            return null;
          } else {
            String phoneNumber = contactPhones.first.value
                ?.trim()
                .replaceAll(RegExp(r'[^\w+]+'), '');
            ;
            print(phoneNumber);
            return phoneNumber;
          }
        })
        .whereType<String>()
        .toList();
  }
  return null;
}
