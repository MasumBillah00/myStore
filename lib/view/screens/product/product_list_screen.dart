import 'package:flutter/material.dart';
import 'package:mystore/view/screens/login/login_screen.dart';
import 'package:mystore/view/screens/product/product_list_grid.dart';
import '../../components/button_Screen.dart';
import '../../components/log_out_notification.dart';
import 'card_screen.dart';
import 'product_upload.dart';

class Product_List extends StatefulWidget {
  static const String id = 'Product_List';
  final String roleName;

  const Product_List({Key? key, required this.roleName}) : super(key: key);

  @override
  State<Product_List> createState() => _Product_ListState();
}

class _Product_ListState extends State<Product_List> {
  int _selectedIndex = 0;

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LogoutConfirmationDialog();
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isAdmin = widget.roleName == 'Admin';

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MyStore',
                  style: TextStyle(
                    color: Color(0xFF041A3A),
                    //color: Colors.black,
                    fontSize: 30,
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Let\'s shopping',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF041A3A),
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                )
              ],
            ),
            SizedBox(
              width: 100,
              child: IconButton(
                icon: const Icon(
                  Icons.search,
                  size: 40,
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
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [



              SizedBox(
                height: 150,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/card.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 4,
                      color: Colors.black.withOpacity(0.1), // Semi-transparent overlay
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Product Title',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Description of the product goes here..',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),


          
              Container(


          
                height: MediaQuery.of(context).size.height,
                  child: const Product_List_Grid(),
          
              ),


          
          
          
            ],
          ),
        ),
      ),

      //floatingActionButton: isAdmin ? FAddButton(): null,
      floatingActionButton: const FAddButton(),

      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'Log Out',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFF510C35), // Color for selected item
          unselectedItemColor: const Color(0xFFCCCCCC), // Lighter color for unselected items
          onTap: (int index) {
            if (index == 3) {
              // If the logout icon is tapped (index 3), navigate to the login page
              _showLogoutConfirmationDialog(context);
            } else {
              // Handle other bottom navigation bar item taps
              _onItemTapped(index);
            }
          }),
    );
  }
}
