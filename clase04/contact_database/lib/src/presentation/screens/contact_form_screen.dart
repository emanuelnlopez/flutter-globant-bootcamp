import 'package:contact_database/src/domain/domain.dart';
import 'package:contact_database/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ContactFormScreen extends StatefulWidget {
  final Contact? contact;

  const ContactFormScreen({super.key, this.contact});

  @override
  State<ContactFormScreen> createState() => _ContactFormScreenState();
}

class _ContactFormScreenState extends State<ContactFormScreen> {
  late final ContactController _controller;
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _emailController;
  late final TextEditingController _birthDateController;
  late final TextEditingController _companyController;
  late final TextEditingController _positionController;

  @override
  void initState() {
    super.initState();

    _controller = context.read<ContactController>();
    _firstNameController = TextEditingController(
      text: widget.contact?.firstName,
    );
    _lastNameController = TextEditingController(
      text: widget.contact?.lastName,
    );
    _phoneNumberController = TextEditingController(
      text: widget.contact?.phoneNumber,
    );
    _emailController = TextEditingController(text: widget.contact?.email);
    _birthDateController = TextEditingController(
      text: widget.contact?.birthDate != null
          ? DateFormat('yyyy-MM-dd').format(widget.contact!.birthDate)
          : null,
    );
    _companyController = TextEditingController(
      text: widget.contact?.company,
    );
    _positionController = TextEditingController(
      text: widget.contact?.position,
    );
  }

  Future<void> _deleteContact() async {
    if (widget.contact != null) {
      await _controller.delete(widget.contact!);
    }

    if (mounted) {
      Navigator.pop(context);
    }
  }

  Future<void> _saveContact() async {
    if (_formKey.currentState!.validate()) {
      final contact = Contact(
        id: widget.contact?.id,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        phoneNumber: _phoneNumberController.text,
        email: _emailController.text,
        birthDate: DateFormat('yyyy-MM-dd').parse(_birthDateController.text),
        company: _companyController.text,
        position: _positionController.text,
      );

      await _controller.save(contact);

      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contact == null ? 'Create Contact' : 'Edit Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          top: 24.0,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _FormField(
                controller: _firstNameController,
                labelText: 'First Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a first name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              _FormField(
                controller: _lastNameController,
                labelText: 'Last Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a last name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              _FormField(
                controller: _phoneNumberController,
                labelText: 'Phone Number',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Please enter a valid 10-digit phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              _FormField(
                controller: _emailController,
                labelText: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              _FormField(
                controller: _birthDateController,
                labelText: 'Birth Date (YYYY-MM-DD)',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a birth date';
                  }
                  try {
                    DateFormat('yyyy-MM-dd').parseStrict(value);
                  } catch (e) {
                    return 'Please enter a valid date in the format YYYY-MM-DD';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              _FormField(
                controller: _companyController,
                labelText: 'Company (Optional)',
              ),
              const SizedBox(height: 8.0),
              _FormField(
                controller: _positionController,
                labelText: 'Position (Optional)',
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.save),
                      label: const Text('SAVE'),
                      onPressed: _saveContact,
                    ),
                  ),
                  if (widget.contact != null) ...[
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.delete),
                        label: const Text('DELETE'),
                        onPressed: _deleteContact,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  const _FormField({
    required this.controller,
    required this.labelText,
    this.validator,
  });

  final TextEditingController controller;
  final String labelText;
  final FormFieldValidator? validator;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
      );
}
