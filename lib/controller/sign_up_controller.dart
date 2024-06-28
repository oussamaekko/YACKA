import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yacka_mobile/model/sexe.dart';
import 'package:yacka_mobile/model/user.dart';

class SignUpController extends GetxController {
  // Reactive variables to store user information
  final Rx<String> nom = Rx('');
  final Rx<String> prenom = Rx('');
  final Rx<String> email = Rx('');
  final Rx<String> password = Rx('');
  final Rx<Sexe> sexe =
      Rx(Sexe(idSexe: 0, libelle: '')); // Initialize with empty Sexe
  final RxInt age = RxInt(0);
  final RxString region = RxString('');
  final RxString fonction = RxString('');

  // Form key for validation (consider using a separate validation logic)
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Function to update user information from each step
  void updateUser({
    required String? newNom,
    required String? newPrenom,
    required String? newEmail,
    required String? newPassword,
    required Sexe? newSexe,
    required int? newAge,
    required String? newRegion,
    required String? newFonction,
  }) {
    nom.value = newNom ?? nom.value;
    prenom.value = newPrenom ?? prenom.value;
    email.value = newEmail ?? email.value;
    password.value = newPassword ?? password.value;
    sexe.value = newSexe ?? sexe.value;
    age.value = newAge ?? age.value;
    region.value = newRegion ?? region.value;
    fonction.value = newFonction ?? fonction.value;
  }

  // Function to create a User object from current information
  User createUser() {
    return User(
      idUser: 0, // You might need to generate a unique ID here
      nom: nom.value,
      prenom: prenom.value,
      email: email.value,
      password: password.value,
      sexe: sexe.value.libelle,
      age: age.value,
      region: region.value,
      points: 0, // Consider adding default values if needed
      fonction: fonction.value,
      nomUtilisateur: '', // You might need to handle username
      numTel: '', // You might need to handle phone number
    );
  }

  // Function to handle form submission (consider adding validation logic)
  void submitSignUp() {
    if (formKey.currentState!.validate()) {
      // Create the User object and perform signup logic
      User user = createUser();
      // Implement your signup logic here (e.g., call an API)
      print(
          'User information: ${user.nom} ${user.prenom}...'); // Replace with actual signup logic
      Get.snackbar('Success', 'Sign up successful!');
    } else {
      Get.snackbar('Error', 'Please fix errors in the form');
    }
  }
}
