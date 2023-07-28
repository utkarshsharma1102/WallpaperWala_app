import 'package:flutter/material.dart';

class CategoryBlock extends StatelessWidget {
  const CategoryBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
                height: 70,
                width: 100,
                fit: BoxFit.cover,
                "https://images.pexels.com/photos/38296/cycling-bicycle-riding-sport-38296.jpeg?auto=compress&cs=tinysrgb&w=1200"),
          ),
          Container(
            height: 70,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.black26, borderRadius: BorderRadius.circular(15)),
          ),
          const Positioned(
            left: 15,
            top: 22,
            child: Text(
              "Road Bike",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
