import 'package:flutter/material.dart';

class SignUpBasicInfoStep extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final void Function(String firstname, String lastname) onSubmit;

  const SignUpBasicInfoStep(
      {super.key, required this.formKey, required this.onSubmit});
  @override
  State<SignUpBasicInfoStep> createState() => _SignUpBasicInfoStepState();
}

class _SignUpBasicInfoStepState extends State<SignUpBasicInfoStep> {
  String _firstname = '';
  String _lastname = '';
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Prenom',
                prefixIcon: Icon(Icons.info),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre nom';
                }
                return null;
              },
              onSaved: (value) => setState(() => _firstname = value!),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nom',
                prefixIcon: Icon(Icons.info),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre prenom';
                }
                return null;
              },
              onSaved: (value) => setState(() => _lastname = value!),
            ),
          ],
        ));
  }
}
