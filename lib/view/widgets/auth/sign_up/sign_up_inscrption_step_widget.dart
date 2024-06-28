import 'package:flutter/material.dart';
import 'package:yacka_mobile/controller/sign_up_controller.dart';

class SignUpInscriptionStep extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final void Function(String email, String username) onSubmit;

  const SignUpInscriptionStep(
      {super.key, required this.formKey, required this.onSubmit});

  @override
  State<SignUpInscriptionStep> createState() => _SignUpInscriptionStepState();
}

class _SignUpInscriptionStepState extends State<SignUpInscriptionStep> {
  String _email = '';
  String _username = '';
  int _phoneNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r"^[a-zA-Z0-9.a-z_+]*@[a-z]+\.[a-z]+")
                  .hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            onSaved: (value) => setState(() => _email = value!),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'numero telephone',
              prefixIcon: Icon(Icons.phone),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number ';
              }
              return null;
            },
            onSaved: (value) => setState(() => _email = value!),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Username',
              prefixIcon: Icon(Icons.account_circle),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
            onSaved: (value) => setState(() => _username = value!),
          ),

          // ElevatedButton(
          //   onPressed: () {
          //     if (widget.formKey.currentState!.validate()) {
          //       widget.formKey.currentState!.save();
          //       widget.onSubmit(_name, _email, _username, _password);
          //     }
          //   },
          //   child: const Text('Sign Up'),
          // ),
        ],
      ),
    );
  }
}
