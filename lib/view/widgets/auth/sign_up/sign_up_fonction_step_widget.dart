import 'package:flutter/material.dart';

class SignUpFonctionStep extends StatefulWidget {
  SignUpFonctionStep({super.key, required this.age});

  final int age;
  List<String> _professions = [
    // "Autres sans activité professionnelle",
    'J\'exerce une activité professionnelle',
    'Je suis chômeur ayant déjà travaillé',
    ' Je suis retraité ou préretraité',
    "Autres sans activité professionnelle",
  ];

  @override
  State<SignUpFonctionStep> createState() => _SignUpFonctionStepState();
}

class _SignUpFonctionStepState extends State<SignUpFonctionStep> {
  String? _selectedProfession;
  String? _ageCategory;

  @override
  void initState() {
    super.initState();
    _ageCategory = getAgeCategory(widget.age); // Call new function here
    print("age category: " + _ageCategory!);

    widget._professions = getProfessionsByAgeCategory(_ageCategory!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Fonction'),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12.0, // Add spacing between boxes
          children: widget._professions
              .map((profession) => _buildProfessionBox(profession))
              .toList(),
        ),
      ],
    );
  }

  String getAgeCategory(int age) {
    if (age >= 18 && age <= 25) {
      return '2';
    } else if (age > 25 && age <= 60) {
      return '3';
    } else if (age > 60) {
      return '4';
    } else {
      return '1'; // Default category for age < 18
    }
  }

  Widget _buildProfessionBox(String profession) {
    return TextButton(
      onPressed: () {
        setState(() {
          _selectedProfession = profession;
        });
      },
      child: Container(width: double.infinity, child: Text(profession)),
      style: TextButton.styleFrom(
        primary:
            _selectedProfession == profession ? Colors.white : Colors.black,
        backgroundColor:
            _selectedProfession == profession ? Colors.blue : Colors.grey[200],
        padding: const EdgeInsets.all(12.0),
      ),
    );
  }

  List<String> getProfessionsByAgeCategory(String ageCategory) {
    List<String> filteredProfessions = [];

    // Define profession categories based on age (same as before)
    const ageCategories = {
      '1': [
        'J\'exerce une activité professionnelle',
        'Je suis chômeur ayant déjà travaillé',
        ' Je suis retraité ou préretraité'
      ],
      '2': [
        ' Je suis à la recherche d\'un premier emploi',
        ' Je suis élève, étudiant',
        ' Je suis une personne au foyer',
        ' Je suis sans profession'
      ],
      '3': [
        'Agriculteurs exploitants',
        'Artisans, commerçants, chefs entreprise',
        'Cadres, professions intellectuelles sup., professions libérales',
        'Professions intermédiaires',
        'Employés',
        'Ouvriers'
      ],
      '4': ['Retraités'],
    };

    // Check if the provided age category exists
    if (ageCategories.containsKey(ageCategory)) {
      filteredProfessions = ageCategories[ageCategory]!;
    } else {
      // If age category is not found, include all professions
      filteredProfessions = widget._professions;
    }

    // Call setState here to update UI
    setState(() {
      print("changing list");
    });

    return filteredProfessions;
  }
}
