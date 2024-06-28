import 'package:flutter/material.dart';

class SignUpMoreInfoStep extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  final void Function(String password, String addresse) onSubmit;
  const SignUpMoreInfoStep(
      {super.key, required this.formKey, required this.onSubmit});

  @override
  State<SignUpMoreInfoStep> createState() => _SignUpMoreInfoStepState();
}

class _SignUpMoreInfoStepState extends State<SignUpMoreInfoStep> {
  String _password = '';
  String _addresse = '';
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'adresse',
                prefixIcon: Icon(Icons.location_city_outlined),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre adresse';
                }
                return null;
              },
              onSaved: (value) => setState(() => _addresse = value!),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'mode de passe',
                prefixIcon: Icon(Icons.password),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre mode de passe';
                }
                return null;
              },
              onSaved: (value) => setState(() => _password = value!),
            ),
            const SizedBox(height: 20),
          ],
        ));
  }
}
