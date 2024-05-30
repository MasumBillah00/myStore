import 'package:flutter/material.dart';
import 'package:mystore/view/components/button_Screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String weight;
  final String description;

  ProductDetailsScreen({
    required this.image,
    required this.name,
    required this.price,
    required this.weight,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    image,
                    fit: BoxFit.cover,
                    height: 300,
                    width: double.infinity,
                  ),
                  Positioned(
                    top: 33.0,
                    left: 18.0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black, size: 30,),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 33.0,
                    right: 16.0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.favorite_border, color: Colors.black, size: 27,),
                        onPressed: () {
                          // Handle favorite action
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          price,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Weight: $weight',
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(

                  children: [
                    Expanded(
                      child: RoundedButton(
                        title: 'BUY Now',

                        colour: Colors.black,
                        onPressed: (){},
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: RoundedButton(
                        title: 'Chat with Seller',
                        colour: Colors.lightGreenAccent.shade200,
                        onPressed: (){},
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
