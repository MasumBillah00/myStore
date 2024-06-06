import 'package:flutter/material.dart';
import 'package:mystore/view/components/button_Screen.dart';
import 'package:mystore/view/screens/product/product_list_screen.dart';
import '../../components/kcontainerbox.dart';
import '../../components/product_detail_size.dart';

class ProductDetailPage extends StatefulWidget {
  static const String id = 'ProductDetailPage';
  final Map<String, dynamic> product;

  ProductDetailPage({required this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = false;
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                widget.product['image'] != null
                    ? Stack(
                        children: [
                          SizedBox(
                            height: 350,
                            width: double.infinity,
                            child: Image.network(
                              widget.product['image'],
                              //fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Card(
                              color: Colors.black.withOpacity(0.3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5.0, // Adds elevation to the card
                              margin: const EdgeInsets.all(8.0), // Sets margin around the card
                              shadowColor: Colors.grey.withOpacity(0.5), // Sets the shadow color
                              clipBehavior: Clip.antiAlias, // Clips the content with anti-aliasing
                              child: IconButton(
                                icon: const Icon(
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
                            child: Card(
                              color: Colors.black.withOpacity(0.3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5.0, // Adds elevation to the card
                              margin: const EdgeInsets.all(8.0), // Sets margin around the card
                              shadowColor: Colors.grey.withOpacity(0.5), // Sets the shadow color
                              clipBehavior: Clip.antiAlias, // Clips the content with anti-aliasing
                              child: IconButton(
                                icon: Icon(
                                  isFavorite ? Icons.favorite : Icons.favorite_border,
                                  color: isFavorite ? Colors.red : Colors.black,
                                  size: 30,
                                ),
                                onPressed: _toggleFavorite,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (() {
                        var words = (widget.product['title'] ?? '').split(' ');
                        if (words.length > 3) {
                          return words.sublist(0, 3).join(' ') + '...';
                        }
                        return widget.product['title'] ?? '';
                      })(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      ' \$${widget.product['price']?.toStringAsFixed(2) ?? ''}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                KContainerBox(product: widget.product),
                SizedBox(
                  height: 5,
                ),
                // Size details
                SizeCard(),

                const Text(
                  'Description:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  (() {
                    var description = widget.product['description'] ?? '';
                    const int maxDescriptionLength = 150; // Maximum characters to display
                    if (description.length > maxDescriptionLength) {
                      return description.substring(0, maxDescriptionLength) + '...';
                    }
                    return description;
                  })(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: 'SourceSansPro',
                  ),
                  textAlign: TextAlign.justify, // Align text to justify
                ),
                const SizedBox(
                  height: 15,
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: Colors.white.withOpacity(.2),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          // Add your onTap functionality here
                          print("Card tapped!");
                        },
                        child: Container(
                          height: 50,
                          width: 70,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.black,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: Colors.white.withOpacity(.2),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          // Add your onTap functionality here
                          print("Card tapped!");
                        },
                        child: Container(
                          height: 50,
                          width: 70,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.chat_outlined,
                            color: Colors.black,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),

                    Expanded(
                      child: RoundedButton(
                        title: 'Buy Now',
                        colour: Colors.black.withOpacity(.7),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
