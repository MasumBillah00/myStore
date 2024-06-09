// import 'package:flutter/material.dart';
//
// class PositionedCardButton extends StatelessWidget {
//   final double top;
//   final double left;
//   final double right;
//   final VoidCallback onTap;
//   final Icon icon;
//
//   PositionedCardButton({
//     this.top = 0.0,
//     this.left = 0.0,
//     this.right = 0.0,
//     required this.onTap,
//     required this.icon,
//   });
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: top,
//       left: left,
//       right: right,
//       child: Card(
//         color: Colors.black.withOpacity(0.3),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         elevation: 5.0, // Adds elevation to the card
//         margin: const EdgeInsets.all(8.0), // Sets margin around the card
//         shadowColor: Colors.grey.withOpacity(0.5), // Sets the shadow color
//         clipBehavior: Clip.antiAlias, // Clips the content with anti-aliasing
//         child: IconButton(
//           icon: icon,
//           onPressed: onTap,
//         ),
//       ),
//     );
//   }
// }
