import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mystore/view/components/button_Screen.dart';
import 'package:mystore/view/screens/product/productdetailpage.dart';

import '../../components/constants.dart';

class ProductUploadScreen extends StatefulWidget {
  @override
  _ProductUploadScreenState createState() => _ProductUploadScreenState();
}

class _ProductUploadScreenState extends State<ProductUploadScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _skuController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  List<String> _imageUrls = [];

  void _addImageUrl() {
    if (_imageUrlController.text.isNotEmpty) {
      setState(() {
        _imageUrls.add(_imageUrlController.text);
        _imageUrlController.clear();
      });
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final url = 'https://fakestoreapi.com/products';

      final Map<String, dynamic> productData = {
        'title': _titleController.text,
        'price': double.parse(_priceController.text),
        'description': _descriptionController.text,
        'category': 'men\'s clothing', // Set this as per your requirements
        'image': _imageUrls.isNotEmpty ? _imageUrls[0] : '', // Using the first image URL if available
        'rating': {
          'rate': 0, // Placeholder value
          'count': 0 // Placeholder value
        }
      };

      try {
        final response = await http.post(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(productData),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          final uploadedProduct = json.decode(response.body);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(product: uploadedProduct),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product uploaded successfully')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to upload product')),
          );
        }
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('An error occurred')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Add Product',
          style: TextStyle(
          fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade900,
            fontFamily: 'SourceSansPro',
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
               Text('Product Details',style:TextStyle(
                color: Colors.blue.shade900,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                 fontFamily: 'SourceSansPro',
              ),),
              TextFormField(
                controller: _titleController,
                decoration:  InputDecoration(
                  labelText: 'Title',
                    labelStyle: LTextStyle()
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    labelText: 'Description',
                labelStyle: LTextStyle(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _skuController,
                decoration:  InputDecoration(
                    labelText: 'SKU',
                labelStyle: LTextStyle(),),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an SKU';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration:  InputDecoration(
                  labelText: 'Price',
                  labelStyle: LTextStyle(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _weightController,
                decoration:  InputDecoration(
                    labelText: 'Weight',
                labelStyle: LTextStyle(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a weight';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid weight';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageUrlController,
                decoration: InputDecoration(
                  labelText: 'Image URL',
                  labelStyle: LTextStyle(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.add,size: 25,),
                    onPressed: _addImageUrl,
                  ),
                ),
                keyboardType: TextInputType.url,
              ),
              const SizedBox(height: 20,),
              _imageUrls.isNotEmpty
                  ? Column(
                children: _imageUrls.map((url) {
                  return Stack(
                    children: [
                      Image.network(
                        url,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.remove_circle, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _imageUrls.remove(url);
                            });
                          },
                        ),
                      ),
                    ],
                  );
                }).toList(),
              )
                  : const Text('No image URLs added'),
              const SizedBox(height: 20,),
              RoundedButton(
                title: 'Submit',
                colour: Colors.blue.shade800,
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}