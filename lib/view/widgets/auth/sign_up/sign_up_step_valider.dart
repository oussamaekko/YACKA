import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:yacka_mobile/model/sexe.dart';
import 'package:yacka_mobile/model/user.dart';

class SignUpValiderStep extends StatelessWidget {
  const SignUpValiderStep({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Valider"));
  }
}

class SignUpSummaryWidget extends StatelessWidget {
  final User user;

  const SignUpSummaryWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign Up Summary:',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 16.0),
          Text('Personal Information:'),
          const SizedBox(height: 8.0),
          _buildInfoRow('Name:', user.nom + ' ' + user.prenom),
          _buildInfoRow('Email:', user.email),
          _buildInfoRow('Sexe:', user.sexe),
          _buildInfoRow('Age:', user.age.toString()),
          // Add more info rows as needed
          const Divider(thickness: 1.0),
          const SizedBox(height: 8.0),
          Text('Additional Information:'),
          const SizedBox(height: 8.0),
          _buildInfoRow('Region:', user.region),
          _buildInfoRow('Phone Number:', user.numTel),
          const Divider(thickness: 1.0),
          const SizedBox(height: 8.0),
          Text('Fonction : '),
          const SizedBox(height: 8.0),
          _buildInfoRow('Fonction:', user.fonction),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8.0),
        Text(value),
      ],
    );
  }
}
