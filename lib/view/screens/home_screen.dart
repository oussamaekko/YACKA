import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:yacka_mobile/view/screens/product_detail_screen.dart';
import 'package:yacka_mobile/view/widgets/list_category_widget.dart';
import 'package:yacka_mobile/view/widgets/navigation_drawer.dart' as yacka;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: yacka.NavigationDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Get.width * 0.03),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: Get.height * 0.07,
              ),
              //: CREATE HEADER SECTION THAT CONTAINS BUGER MENU AND POINTS OF THE PERSON
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // : CREATE BURGER MENU
                  Builder(builder: (context) {
                    return InkWell(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                        print("Hello world");
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(Icons.menu),
                      ),
                    );
                  }),
                  // : CREATE POINTS OF THE PERSON
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.card_giftcard),
                        onPressed: () {},
                      ),
                      Text("2500 pts")
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),

              // : CREATE TITLE SECTION
              Text("Explore  \nOur Products !",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              // : CREATE ROW OF CATEGORIES AS BUTTONS
              const SizedBox(height: 10),
              ListCategories(),
              const SizedBox(height: 20),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    promoCard('assets/images/apple_products/1.jpeg'),
                    promoCard('assets/images/apple_products/2.jpg'),
                    promoCard('assets/images/apple_products/3.jpeg'),
                    promoCard('assets/images/apple_products/4.jpeg'),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.01),
              const Text(
                "Nouvelles etuds",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(height: Get.height * 0.02),
              productCard('assets/images/apple_products/food.jpg'),
              SizedBox(height: Get.height * 0.02),
              productCard('assets/images/apple_products/1.jpeg')

              //TODO : CREATE LIST OF NEW PRODUCTS (NOUVELLES ETUDES )
            ]),
          ),
        ));
  }
}

Widget promoCard(image) {
  return AspectRatio(
    aspectRatio: 3 / 3,
    child: Container(
      margin: const EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          )),
      child: Container(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Iphone 14 PRO",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
              Text(
                "2500 pts",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
            border:
                Border.all(width: 2, color: Color.fromARGB(255, 209, 202, 202)),
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                stops: const [
                  0.1,
                  0.9
                ],
                colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.1)
                ])),
      ),
    ),
  );
}

Widget productCard(image) {
  return InkWell(
    onTap: () {
      Get.to(() => ProductDetailPage());
    },
    child: Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: Get.height * 0.2,
      decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          )),
      child: Container(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "2500 pts",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Food & Drink",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(3)),
                        child: Text(
                          "> 13",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(Icons.punch_clock, color: Colors.white, size: 15),
                      SizedBox(
                        width: 5,
                      ),
                      Text("11 min",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            border:
                Border.all(width: 2, color: Color.fromARGB(255, 209, 202, 202)),
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                stops: const [
                  0.1,
                  0.9
                ],
                colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.1)
                ])),
      ),
    ),
  );
}
