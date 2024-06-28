import 'package:flutter/material.dart';

class CustomAgedCard extends StatefulWidget {
  const CustomAgedCard({
    Key? key,
    required this.image,
    required this.title,
    required this.gender,
    required this.age,
    required this.onSexeChanged,
  }) : super(key: key);
  final String image;
  final int age;
  final String title;
  final String gender;
  final ValueChanged<int> onSexeChanged;

  @override
  State<CustomAgedCard> createState() => _CustomAgedCardState();
}

class _CustomAgedCardState extends State<CustomAgedCard> {
  late int? selectedAge;
  String? gender;
  String? imagePath = 'assets/images/tennisplayer2.jpg';

  @override
  void initState() {
    super.initState();
    selectedAge = widget.age;
    gender = widget.gender;
    print('init state gen ' + widget.gender);
    imagePath = getImageBasedOnAgeAndGender(widget.gender, widget.age);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 270,
        height: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(imagePath!),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Women's \nClub",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: DropdownButton<int>(
                    onTap: () {
                      widget.onSexeChanged(selectedAge!);
                    },
                    value: selectedAge,
                    hint: const Text(
                      "Select age",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 20,
                    elevation: 10,
                    borderRadius: BorderRadius.circular(10),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    underline: Container(
                      height: 0,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (int? newValue) {
                      setState(() {
                        selectedAge = newValue;
                        widget.onSexeChanged(selectedAge!);
                      });
                    },
                    items: List.generate(100, (index) => index + 1)
                        .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const Expanded(child: Text("")),
              const Text(
                "2 events",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String getImageBasedOnAgeAndGender(String gender, int age) {
  print("getImageBasedOnAgeAndGender: $gender, $age");
  if (gender == 'MALE') {
    if (age >= 0 && age <= 12) {
      return 'assets/images/boy.png'; // Boy
    } else if (age >= 13 && age <= 18) {
      return 'assets/images/teen_boy.jpg'; // Teen Boy
    } else if (age >= 19 && age <= 40) {
      return 'assets/images/man.jpg'; // Man
    } else if (age > 40) {
      return 'assets/images/old_man.jpg'; // Old Man
    }
  } else if (gender == 'FEMALE') {
    if (age >= 0 && age <= 12) {
      return 'assets/images/tennisplayer2.jpg'; // Girl
    } else if (age >= 13 && age <= 18) {
      return 'assets/images/teen_girl.jpg'; // Teen Girl
    } else if (age >= 19 && age <= 40) {
      return 'assets/images/woman.jpg'; // Woman
    } else if (age > 40) {
      return 'assets/images/old_woman.jpg'; // Old Woman
    }
  }
  return 'assets/images/tennisplayer2.jpg'; // Default image for any other cases
}
