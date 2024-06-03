import 'package:flutter/material.dart';

class product_list_card extends StatelessWidget {
  const product_list_card({
    super.key,
    required this.product,
  });

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),

      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20) ),
        child: Image.network(
          product['image'],
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}