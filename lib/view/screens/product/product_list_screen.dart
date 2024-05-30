import 'package:flutter/material.dart';
import 'package:mystore/view/screens/product/product_list_grid.dart';

import 'card_screen.dart';

class Product_List extends StatefulWidget {
  static const String id = 'Product_List';

  @override
  State<Product_List> createState() => _Product_ListState();
}

class _Product_ListState extends State<Product_List> {

  int _selectedIndex = 0;
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('MyStore',style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),),
                Text('Let\'s shopping',style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,

                ),),
              ],
            ),
            Container(
              width: 100,
              child: IconButton(
                icon: Icon(Icons.search,size: 40,
                ),
                onPressed: () {
                  // Handle search action here
                },
              ),
            ),

          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Use Expanded or SizedBox to give a defined height to the Stack
            SizedBox(
              height: 150, // Adjust the height as needed
              child: Stack(
                children: [
                  // Background Image
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/card.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Card Content
                  Card_Screen(),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Product_List_Grid(),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
          label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF510C35),
        onTap: _onItemTapped,
      ),
    );
  }
}

