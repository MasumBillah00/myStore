import 'package:flutter/material.dart';

class ProductDetailsBottomButton extends StatelessWidget {
  final VoidCallback onTap;
  final Icon icon;

  ProductDetailsBottomButton({required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.black.withOpacity(.1),
      elevation: 4,
      shadowColor: Colors.black,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          height: 45,
          width: 70,
          alignment: Alignment.center,
          child: icon,
        ),
      ),
    );
  }
}
