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
        Card(
          color: Color(0xFF041A3A).withOpacity(0.82),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 5.0,
          shadowColor: Colors.black,
          clipBehavior: Clip.antiAlias,

          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text(
                //
                //   style: TextStyle(
                //     fontWeight: FontWeight.w600,
                //     fontSize: 18,
                //     color: Colors.white,
                //     fontFamily: 'SourceSansPro',
                //   ),
                // ),
                //const SizedBox(height: 1),
                Text(
                  product['category'] ?? '',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                      fontFamily: 'SourceSansPro',
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 1,
        ),
        Card(
          color: Color(0xFF041A3A).withOpacity(0.82),
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
                // const Text(
                //   '',
                //   style: TextStyle(
                //     fontWeight: FontWeight.w600,
                //     fontSize: 18,
                //     color: Colors.white,
                //     fontFamily: 'SourceSansPro',
                //   ),
                // ),
                //const SizedBox(height: 1),
                // if (product['rating'] != null && product['rating'] is Map<String, dynamic>)
                //   Text(
                //     '${product['rating']['rate'] ?? 0} (${product['rating']['count'] ?? 0} )',
                //     style: TextStyle(
                //       fontSize: 18,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.white,
                //       fontFamily: 'SourceSansPro',
                //     ),
                //   )
                // else
                //   const Text('No ratings available'),
                if (product['rating'] != null && product['rating'] is Map<String, dynamic>)
                  Text(
                    '${product['rating']['rate'] ?? 0}  ★',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'SourceSansPro',
                    ),
                  )
                else
                  const Text('No ratings available'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
