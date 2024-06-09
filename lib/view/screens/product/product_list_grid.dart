import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mystore/view/screens/product/product_list_card.dart';
import 'dart:convert';
import 'package:mystore/view/screens/product/productdetailpage.dart';

class Product_List_Grid extends StatefulWidget {
  const Product_List_Grid({Key? key}) : super(key: key);

  @override
  _Product_List_GridState createState() => _Product_List_GridState();
}

class _Product_List_GridState extends State<Product_List_Grid> {
  List<Map<String, dynamic>> products = []; // Updated to store uploaded products

  @override
  void initState() {
    super.initState();
    fetchProducts(); // Fetch products when the widget initializes
  }

  void fetchProducts() async {
    const url = 'https://fakestoreapi.com/products';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          products = responseData.cast<Map<String, dynamic>>(); // Update the products list
        });
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 2.5 / 3,
            ),
            itemCount: products.length, // Update to use the fetched products
            itemBuilder: (context, index) {
              final product = products[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(product: product),
                          ),
                        );
                      },
                      child: product_list_card(product: product),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['title'],
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${product['price'].toString()}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                    ],
                  ),

                ],
              );
            },
          ),
        ),
      ),
    );
  }
}