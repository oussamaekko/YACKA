import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yacka_mobile/model/sexe.dart';
import 'package:yacka_mobile/model/user.dart';
import 'package:yacka_mobile/view/screens/home_screen.dart';
import 'package:yacka_mobile/view/widgets/auth/sign_up/sign_up_age_step_widget.dart';
import 'package:yacka_mobile/view/widgets/auth/sign_up/sign_up_basic_information_step_widget.dart';
import 'package:yacka_mobile/view/widgets/auth/sign_up/sign_up_fonction_step_widget.dart';
import 'package:yacka_mobile/view/widgets/auth/sign_up/sign_up_inscrption_step_widget.dart';
import 'package:yacka_mobile/view/widgets/auth/sign_up/sign_up_more_information_step_widget.dart';
import 'package:yacka_mobile/view/widgets/auth/sign_up/sign_up_sexe_step_widget.dart';
import 'package:yacka_mobile/view/widgets/auth/sign_up/sign_up_region_step_widget.dart';
import 'package:yacka_mobile/view/widgets/auth/sign_up/sign_up_step_valider.dart';
import 'package:yacka_mobile/view/widgets/age_dynamic_cart_widget.dart';

import 'package:yacka_mobile/view/widgets/auth/sign_up_form_widget.dart';
import 'package:yacka_mobile/view/widgets/card_gender_widget.dart';
import 'package:yacka_mobile/core/constant/color.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  User user = User(
      idUser: 1,
      nom: 'nom',
      prenom: 'prenom',
      email: 'email',
      password: 'password',
      sexe: 'sexe',
      age: 12,
      region: 'region',
      points: 0,
      fonction: 'fonction',
      nomUtilisateur: 'nomUtilisateur',
      numTel: 'numTel');
  int currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  Sexe sexe = Sexe(idSexe: 0, libelle: '');
  final List<String> genders = [
    "Male",
    "Female",
  ]; // Example genders list
  final List<String> regions = [
    "Marrakech-Safi",
    "Casablanca-Settat",
    "Tanger-Tetouan-Al Hoceima"
  ]; // Example regions list
  int age = 12;
  String gen = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Sign Up'),
      ),
      body: SafeArea(
        child: Center(
          child: Stepper(
            steps: getSteps(),
            currentStep: currentStep,
            onStepContinue: () {
              setState(() {
                if (currentStep == 3) {
                  if (sexe.libelle == 'FEMALE' || sexe.libelle == 'MALE') {
                  } else {
                    Get.snackbar('Error', 'Please select your sexe');
                    return;
                  }
                }

                if (currentStep < getSteps().length - 1) {
                  currentStep += 1;
                  sexe;
                  gen = sexe.libelle;
                }

                // if (currentStep == 7) {
                //   // Perform sign-up logic here
                //   Get.snackbar('Success', 'Sign up successful!');
                //   Get.to(HomePage());
                // }
              });
            },
            onStepTapped: (int index) {
              setState(() {
                currentStep = index;
              });
            },
            onStepCancel: () {
              setState(() {
                if (currentStep > 0) {
                  currentStep -= 1;
                }
              });
            },
            type: StepperType.horizontal,
            elevation: 0,
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() {
    return [
      Step(
        title: Text(''),
        content: Container(
            child: SignUpInscriptionStep(
          formKey: _formKey,
          onSubmit: (email, username) {},
        )),
        isActive: currentStep >= 0,
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: Text(''),
        content: Container(
            child: SignUpMoreInfoStep(
          formKey: _formKey2,
          onSubmit: (password, addresse) {
            // Process sign-up data here (e.g., submit to backend)
          },
        )),
        isActive: currentStep >= 1,
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: Text(''),
        content: Container(
          child: SignUpBasicInfoStep(
            formKey: _formKey3,
            onSubmit: (firstname, lastname) {},
          ),
        ),
        isActive: currentStep >= 2,
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: Text(''),
        content: Container(
          child: SignUpSexStep(
            sexe: sexe,
            onSexeChanged: (newSexe) {
              setState(() {
                sexe = newSexe;
                print('SignUpSexStep' + sexe.libelle);
                gen = newSexe.libelle;
              });
            },
          ),
        ),
        isActive: currentStep >= 3,
        state: currentStep > 3 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: Text(''),
        content: Container(
          child: CustomAgedCard(
            image: 'assets/images/tennisplayer2.jpg',
            gender: gen,
            title: 'Age',
            age: age,
            onSexeChanged: (newAge) {
              setState(() {
                age = newAge;
              });
            },
          ),
        ),
        isActive: currentStep >= 4,
        state: currentStep > 4 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: Text(''),
        content: Container(
            // child: SignUpRegionStep(),
            child: Container()),
        isActive: currentStep >= 5,
        state: currentStep > 5 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: Text(''),
        content: Container(
          child: SignUpFonctionStep(
            age: age,
          ),
        ),
        isActive: currentStep >= 6,
        state: currentStep > 6 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: Text(''),
        content: Container(
          child: SignUpSummaryWidget(
            user: user,
          ),
        ),
        isActive: currentStep >= 7,
        state: currentStep > 7 ? StepState.complete : StepState.indexed,
      ),
    ];
  }
}
