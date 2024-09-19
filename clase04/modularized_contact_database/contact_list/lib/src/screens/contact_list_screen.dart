import 'dart:async';

import 'package:contact_list/src/controller/contact_controller.dart';
import 'package:contact_list/src/screens/contact_form_screen.dart';
import 'package:contact_list/src/widgets/contact_item.dart';
import 'package:contact_list/src/widgets/empty_view.dart';
import 'package:contact_list/src/widgets/loading_view.dart';
import 'package:contact_list_domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  List<Contact>? _contacts;
  late final ContactController _controller;
  final List<StreamSubscription> _subscriptions = [];

  void _cancelSubscriptions() {
    for (var sub in _subscriptions) {
      sub.cancel();
    }

    _subscriptions.clear();
  }

  @override
  void dispose() {
    _cancelSubscriptions();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _cancelSubscriptions();

    _controller = context.read<ContactController>();
    _subscriptions.add(_controller.contactStream.listen((contacts) {
      setState(() => _contacts = contacts);
    }));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modularized Contact List App')),
      body: _ContactListBody(contacts: _contacts),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ContactFormScreen(),
            ),
          );
          //_refreshContacts();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ContactListBody extends StatelessWidget {
  const _ContactListBody({this.contacts});

  final List<Contact>? contacts;

  @override
  Widget build(BuildContext context) {
    Widget result;

    if (contacts == null) {
      result = const LoadingView();
    } else if (contacts?.isNotEmpty == false) {
      result = const EmptyView();
    } else {
      result = ListView.builder(
        itemCount: contacts!.length,
        itemBuilder: (context, index) => ContactItem(contact: contacts![index]),
      );
    }

    return result;
  }
}
