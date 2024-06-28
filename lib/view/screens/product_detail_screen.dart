import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yacka_mobile/core/constant/color.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int counter = 0;
  List RandomImages = [
    'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg',
    'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
    'https://i0.wp.com/thatrandomagency.com/wp-content/uploads/2021/06/headshot.png?resize=618%2C617&ssl=1',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaOjCZSoaBhZyODYeQMDCOTICHfz_tia5ay8I_k3k&s'
  ];
  String content =
      " In Flutter, rich text is facilitated by the RichText widget, which allows you to combine text spans with various styles into a single paragraph.Rich text is a text that displays multiple styles within a single cohesive block. In Flutter, rich text is facilitated by the RichText widget, which allows you to combine text spans with various styles into a single paragraph.Rich text is a text that displays multiple styles within a single cohesive block. In Flutter, rich text is facilitated by the RichText widget, which allows you to combine text , which allows you to combine text spans with various styles into a single paragraph.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          setState(() {
            counter = counter + 1;
          });
        },
        child: Container(
          width: Get.width * 0.1,
          height: Get.height * 0.1,
          child: Icon(Icons.favorite),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/erza.jpg'), // Replace with your image path
                      fit: BoxFit
                          .cover, // Adjust as needed (cover, contain, etc.)
                    ),
                  ),
                  child: Column(children: []),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                    color: Colors.grey[200],
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        child: SingleChildScrollView(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Get.height * 0.07,
                            ),
                            Text(
                              "Sondage Fashion",
                              style: TextStyle(fontSize: 22),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "imane Chnani",
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  "+40 points",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _ListProfileCircleAvatar(RandomImages),
                            ),
                            Text(
                              "Description",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            RichText(
                              text: TextSpan(
                                  text: '$content',
                                  // style: DefaultTextStyle.of(context).style,
                                  style: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 35, 34, 34),
                                      height: 1.4,
                                      fontSize: 14)),
                            ),
                            SizedBox(height: Get.height * 0.01),
                            TextButton(
                                onPressed: () => {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      color: appColors.cardGenederColor),
                                  width: double.infinity,
                                  height: Get.height * 0.05,
                                  child: Center(
                                      child: Text(
                                    "Demander",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )),
                                ))
                          ],
                        )),
                      ),
                    )),
              ),
            ],
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.40,
              left: 10.0,
              right: 10.0,
              child: Card(
                  child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildPictureCard(
                        'assets/images/erza.jpg'), // Replace with your image path
                    _buildPictureCard(
                        'assets/images/erza.jpg'), // Replace with your image path
                    _buildPictureCard(
                        'assets/images/erza.jpg'), // Replace with your image path
                  ],
                ),
              )))
        ],
      ),
    );
  }
}

Widget _buildPictureCard(String imagePath) {
  return Container(
    height: Get.width * 0.14,
    width: Get.width * 0.25,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7.0), // Add some rounded corners
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover, // Adjust as needed
      ),
    ),
    // Add some padding if needed
  );
}

Widget _ListProfileCircleAvatar(List RandomImages) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      for (int i = 0; i < RandomImages.length; i++)
        Container(
          margin: EdgeInsets.symmetric(vertical: 0),
          child: Align(
              widthFactor: 0.5,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    RandomImages[i],
                  ),
                ),
              )),
        )
    ],
  );
}
