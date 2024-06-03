import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:mystore/view/components/button_Screen.dart';
import 'package:mystore/view/screens/product/product_list_screen.dart';

import '../../components/kcontainerbox.dart';

class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            product['image'] != null
                ? Stack(
                    children: [
                      SizedBox(
                        height: 350,
                        width: double.infinity,
                        child: Image.network(
                          product['image'],
                          //fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {
                              // Handle favorite action
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  (() {
                    var words = (product['title'] ?? '').split(' ');
                    if (words.length > 5) {
                      return words.sublist(0, 3).join(' ') + '...';
                    }
                    return product['title'] ?? '';
                  })(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),





                Text(
                  ' \$${product['price']?.toStringAsFixed(2) ?? ''}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(height: 10),
            ksontainerbox(product: product),


            SizedBox(height: 10),
            Text(
              'Description: ${product['description'] ?? ''}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedButton(
                  title: 'ViewList',
                  colour: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Product_List(
                                  roleName: '',
                                )));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

