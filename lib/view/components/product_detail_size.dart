import 'package:flutter/material.dart';

class SizeCard extends StatefulWidget {
  const SizeCard({super.key});

  @override
  _SizeCardState createState() => _SizeCardState();
}

class _SizeCardState extends State<SizeCard> {
  List<bool> isSelected = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text('Select Size:',style: TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: 'SourceSansPro',
          fontSize: 20
        ),),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildCard('M', 0),
            buildCard('L', 1),
            buildCard('XL', 2),
            buildCard('XXL', 3),
          ],
        ),
      ],
    );
  }

  Widget buildCard(String size, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = [false, false, false, false]; // Reset all to false
          isSelected[index] = true; // Set the selected index to true
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        shadowColor: Colors.black,
        color: isSelected[index]
            ? Color(0xFF041A3A).withOpacity(.82) // Deep color when selected
            : Colors.black.withOpacity(.3), // Normal color when not selected
        child: Container(
          height: 40,
          width: 50,
          alignment: Alignment.center,
          child: Text(
            size,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
