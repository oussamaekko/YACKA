import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final void Function(
      String name, String email, String username, String password) onSubmit;

  const SignUpForm({super.key, required this.formKey, required this.onSubmit});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String _name = '';
  String _email = '';
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name',
              prefixIcon: Icon(Icons.person),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            onSaved: (value) => setState(() => _name = value!),
          ),
          const SizedBox(height: 20),
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
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            onSaved: (value) => setState(() => _password = value!),
          ),
          const SizedBox(height: 20),
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
