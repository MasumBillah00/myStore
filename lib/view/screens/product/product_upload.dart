import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mystore/view/components/button_Screen.dart';
import 'package:mystore/view/screens/product/productdetailpage.dart';

class ProductInputPage extends StatefulWidget {
  @override
  _ProductInputPageState createState() => _ProductInputPageState();
}

class _ProductInputPageState extends State<ProductInputPage> {
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
            SnackBar(content: Text('Product uploaded successfully')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to upload product')),
          );
        }
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Text('Product Details',style:TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _skuController,
                decoration: InputDecoration(labelText: 'SKU'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an SKU';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
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
                decoration: InputDecoration(labelText: 'Weight'),
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
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: _addImageUrl,
                  ),
                ),
                keyboardType: TextInputType.url,
              ),
              SizedBox(height: 20),
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
                          icon: Icon(Icons.remove_circle, color: Colors.red),
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
                  : Text('No image URLs added'),
              SizedBox(height: 20),
              RoundedButton(
                title: 'Submit',
                colour: Colors.blue,
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
