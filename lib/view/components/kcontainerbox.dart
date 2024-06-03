import 'package:flutter/material.dart';
class ksontainerbox extends StatelessWidget {
  const ksontainerbox({
    super.key,
    required this.product,
  });

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Category:', style: TextStyle(
                      fontWeight: FontWeight.bold,),),
                    SizedBox(height: 5),
                    Text(product['category'] ?? ''),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (product['rating'] != null && product['rating'] is Map<String, dynamic>)
                      Text(
                        'Rating: ${product['rating']['rate'] ?? 0} (${product['rating']['count'] ?? 0} reviews)',
                        style:TextStyle(fontWeight: FontWeight.bold) ,
                      )
                    else
                      Text('Rating: No ratings available'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}