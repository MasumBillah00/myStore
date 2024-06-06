import 'package:flutter/material.dart';

class KContainerBox extends StatelessWidget {
  const KContainerBox({
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
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: Card(
              color: Colors.black.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 7.0,
              shadowColor: Colors.grey.withOpacity(.4),
              clipBehavior: Clip.antiAlias,

              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Category:',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      product['category'] ?? '',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                          fontFamily: 'SourceSansPro',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 1,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: Card(
              color: Colors.black.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 7.0,
              shadowColor: Colors.grey.withOpacity(.4),
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Rating:',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                    const SizedBox(height: 1),
                    if (product['rating'] != null && product['rating'] is Map<String, dynamic>)
                      Text(
                        '${product['rating']['rate'] ?? 0} (${product['rating']['count'] ?? 0} votes)',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: 'SourceSansPro',
                        ),
                      )
                    else
                      const Text('No ratings available'),
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
