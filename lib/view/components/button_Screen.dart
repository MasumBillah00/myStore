import 'package:flutter/material.dart';
import '../screens/product/product_upload.dart';

class RoundedButton extends StatelessWidget {
  final Color colour;
  final String title;
  final VoidCallback onPressed;

  RoundedButton({
    required this.title,
    required this.colour,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(12.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}


class FAddButton extends StatelessWidget {
  const FAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      elevation: 9.0,
      margin: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductUploadScreen()),
            );
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          backgroundColor: Color(0xFFF189FF),
          child: const Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ),
    );
  }
}




class ElevatedButtonScreen extends StatelessWidget {
  const ElevatedButtonScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(vertical: 12),
      ),
      onPressed: () {
        // Add your onPressed functionality here
      },
      child: Text(
        'Buy Now',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}


