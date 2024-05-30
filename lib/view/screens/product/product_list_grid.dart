import 'package:flutter/material.dart';
import 'package:mystore/view/screens/product/product_details.dart';

class Product_List_Grid extends StatefulWidget {
  const Product_List_Grid({Key? key}) : super(key: key);

  @override
  _Product_List_Grid createState() => _Product_List_Grid();
}

class _Product_List_Grid extends State<Product_List_Grid> {
  bool isVisible = true;

  final List<Map<String, String>> products = [
    {
      'image': 'assets/images/product1.jpg', // Add your image paths
      'name': 'Product 1',
      'price': '\$10.00',
  'weight': '10',
  'description': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'
    },
    {
      'image': 'assets/images/product2.jpg', // Add your image paths
      'name': 'Product 2',
      'price': '\$20.00',
      'weight': '10',
      'description': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry' },
    {
      'image': 'assets/images/product3.jpg', // Add your image paths
      'name': 'Product 3',
      'price': '\$30.00',
    'weight': '10',
    'description': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'
    },
    {
      'image': 'assets/images/product1.jpg', // Add your image paths
      'name': 'Product 1',
      'price': '\$10.00',
    'weight': '10',
    'description': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
    },
    {
      'image': 'assets/images/product4.jpg', // Add your image paths
      'name': 'Product 4',
      'price': '\$40.00',
    'weight': '10',
    'description': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
    },
    {
      'image': 'assets/images/product5.jpg', // Add your image paths
      'name': 'Product 5',
      'price': '\$50.00',
    'weight': '10',
    'description': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
    },
    {
      'image': 'assets/images/product2.jpg', // Add your image paths
      'name': 'Product 6',
      'price': '\$60.00',
    'weight': '10',
    'description': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 2 / 2,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                      image: product['image']!,
                      name: product['name']!,
                      price: product['price']!,
                      weight: product['weight']!,
                        description: product['description']!,

                    ),
                  ),
                );
              };
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 4,
              color: Colors.black.withOpacity(0.1),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.asset(
                        product['image']!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),

                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          product['price']!,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),


                ],
              ),

            ),
          );

        },
      ),


    );
  }
}
