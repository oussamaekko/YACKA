import 'package:flutter/material.dart';

class ListCategories extends StatelessWidget {
  ListCategories({super.key});

  int index = 0;
  List categories = [
    "All",
    "Popular",
    "New",
    "Trending",
    "Recommended",
    "Top",
    "Best",
    "Latest",
    "Favourite",
    "Special",
    "Exclusive",
    "Limited",
    "Discount",
    "Sale",
    "Offer",
    "Deal",
    "Hot",
    "Fresh",
    "Unique",
    "Handpicked"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: index == 0 ? Colors.orange : Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                categories[index],
                style: TextStyle(
                    color: index == 0 ? Colors.white : Colors.black,
                    fontWeight:
                        index == 0 ? FontWeight.bold : FontWeight.normal,
                    fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
