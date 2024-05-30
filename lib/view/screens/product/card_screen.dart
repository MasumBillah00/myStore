import 'package:flutter/material.dart';


class Card_Screen extends StatelessWidget {
  const Card_Screen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 4,
      color: Colors.black.withOpacity(0.1), // Semi-transparent overlay
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product Title',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              'Description of the product goes here. This card spans the full width of the screen.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}